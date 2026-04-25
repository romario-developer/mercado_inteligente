import 'package:flutter/material.dart';
import '../models/product.dart';
import '../repositories/shopping_repository.dart';
import 'product_detail_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final ShoppingRepository _repository = ShoppingRepository();
  List<Artigo> _products = [];

  @override
  void initState() {
    super.initState();
    _refreshProducts();
  }

  Future<void> _refreshProducts() async {
    final products = await _repository.getAllProducts();
    setState(() {
      _products = products;
    });
  }

  void _showAddProductDialog() {
    final nameController = TextEditingController();
    final unitController = TextEditingController(text: 'un');

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Cadastrar Novo Item'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(controller: nameController, decoration: const InputDecoration(labelText: 'O que é? (ex: Arroz)')),
            TextField(controller: unitController, decoration: const InputDecoration(labelText: 'Unidade (ex: kg, pacote)')),
          ],
        ),
        actions: [
          TextButton(onPressed: () => Navigator.pop(context), child: const Text('Cancelar')),
          ElevatedButton(
            onPressed: () async {
              if (nameController.text.isNotEmpty) {
                await _repository.addProduct(nameController.text, unitController.text);
                Navigator.pop(context);
                _refreshProducts();
              }
            },
            child: const Text('Salvar'),
          ),
        ],
      ),
    );
  }

  void _showRecordPurchaseDialog(Artigo product) {
    final qtyController = TextEditingController();
    final priceController = TextEditingController();

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Comprei ${product.name}'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              controller: qtyController,
              decoration: InputDecoration(labelText: 'Quantidade (${product.unit})'),
              keyboardType: TextInputType.number,
            ),
            TextField(
              controller: priceController,
              decoration: const InputDecoration(labelText: 'Preço Total Pago (R\$)'),
              keyboardType: TextInputType.number,
            ),
          ],
        ),
        actions: [
          TextButton(onPressed: () => Navigator.pop(context), child: const Text('Cancelar')),
          ElevatedButton(
            onPressed: () async {
              final qty = double.tryParse(qtyController.text) ?? 0;
              final price = double.tryParse(priceController.text) ?? 0;
              if (qty > 0) {
                await _repository.recordPurchase(product.id, qty, price);
                Navigator.pop(context);
                _refreshProducts();
              }
            },
            child: const Text('Registrar'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('🛒 Mercado Inteligente'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: _products.isEmpty
          ? const Center(child: Text('Nenhum item na sua despensa.'))
          : ListView.builder(
              itemCount: _products.length,
              itemBuilder: (context, index) {
                final product = _products[index];
                return Card(
                  elevation: 3,
                  margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                  child: InkWell(
                    borderRadius: BorderRadius.circular(12),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ProductDetailScreen(product: product),
                        ),
                      );
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            product.name,
                            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(height: 8),
                          Text(
                            product.suggestedQuantity != null
                                ? 'Sugestão p/ mês: ${product.suggestedQuantity!.toStringAsFixed(1)} ${product.unit}'
                                : 'Ainda coletando dados de consumo...',
                            style: TextStyle(color: Colors.grey[700]),
                          ),
                          const SizedBox(height: 16),
                          Row(
                            children: [
                              Expanded(
                                child: OutlinedButton.icon(
                                  onPressed: () => _showRecordPurchaseDialog(product),
                                  icon: const Icon(Icons.add_shopping_cart, size: 18),
                                  label: const Text('Comprei'),
                                ),
                              ),
                              const SizedBox(width: 12),
                              Expanded(
                                child: FilledButton.icon(
                                  onPressed: () async {
                                    await _repository.markAsFinished(product.id);
                                    _refreshProducts();
                                    if (context.mounted) {
                                      ScaffoldMessenger.of(context).showSnackBar(
                                        SnackBar(content: Text('Baixa registrada para ${product.name}!')),
                                      );
                                    }
                                  },
                                  icon: const Icon(Icons.done_all, size: 18),
                                  label: const Text('Acabou'),
                                  style: FilledButton.styleFrom(backgroundColor: Colors.redAccent),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
      floatingActionButton: FloatingActionButton(
        onPressed: _showAddProductDialog,
        child: const Icon(Icons.add),
      ),
    );
  }
}