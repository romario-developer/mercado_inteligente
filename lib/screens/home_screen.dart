import 'package:flutter/material.dart';
import '../models/product.dart';
import '../repositories/shopping_repository.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final ShoppingRepository _repository = ShoppingRepository();
  List<Product> _products = [];

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

  // Modal para adicionar novo produto
  void _showAddProductDialog() {
    final nameController = TextEditingController();
    final unitController = TextEditingController(text: 'un');

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Novo Produto'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(controller: nameController, decoration: const InputDecoration(labelText: 'Nome (ex: Açúcar)')),
            TextField(controller: unitController, decoration: const InputDecoration(labelText: 'Unidade (ex: kg)')),
          ],
        ),
        actions: [
          TextButton(onPressed: () => Navigator.pop(context), child: const Text('Cancelar')),
          ElevatedButton(
            onPressed: () async {
              await _repository.addProduct(nameController.text, unitController.text);
              _refreshProducts();
              Navigator.pop(context);
            },
            child: const Text('Salvar'),
          ),
        ],
      ),
    );
  }

  // Modal para registrar que comprou (gera o baseline para o cálculo)
  void _showRecordPurchaseDialog(Product product) {
    final qtyController = TextEditingController();
    final priceController = TextEditingController();

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Comprando ${product.name}'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(controller: qtyController, keyboardType: TextInputType.number, decoration: const InputDecoration(labelText: 'Quantidade')),
            TextField(controller: priceController, keyboardType: TextInputType.number, decoration: const InputDecoration(labelText: 'Preço Total')),
          ],
        ),
        actions: [
          TextButton(onPressed: () => Navigator.pop(context), child: const Text('Cancelar')),
          ElevatedButton(
            onPressed: () async {
              final qty = double.tryParse(qtyController.text) ?? 0;
              final price = double.tryParse(priceController.text) ?? 0;
              await _repository.recordPurchase(product.id, qty, price);
              _refreshProducts();
              Navigator.pop(context);
            },
            child: const Text('Confirmar'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Mercado Inteligente'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: _products.isEmpty
          ? const Center(child: Text('Nenhum produto cadastrado.'))
          : ListView.builder(
              itemCount: _products.size,
              itemBuilder: (context, index) {
                final product = _products[index];
                return Card(
                  margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  child: ListTile(
                    title: Text(product.name, style: const TextStyle(fontWeight: FontWeight.bold)),
                    subtitle: product.suggestedQuantity != null
                        ? Text('Sugestão p/ mês: ${product.suggestedQuantity!.toStringAsFixed(1)} ${product.unit}')
                        : const Text('Aguardando histórico de consumo...'),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        IconButton(
                          icon: const Icon(Icons.shopping_cart, color: Colors.green),
                          onPressed: () => _showRecordPurchaseDialog(product),
                          tooltip: 'Registrar Compra',
                        ),
                        IconButton(
                          icon: const Icon(Icons.outbox, color: Colors.red),
                          onPressed: () async {
                            await _repository.markAsFinished(product.id);
                            _refreshProducts();
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(content: Text('${product.name} marcado como esgotado!')),
                            );
                          },
                          tooltip: 'Acabou!',
                        ),
                      ],
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