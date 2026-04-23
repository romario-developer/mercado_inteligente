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
  List<Artigo> _products = []; // CORRIGIDO: de Produto para Artigo

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
        title: const Text('Novo Artigo'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(controller: nameController, decoration: const InputDecoration(labelText: 'Nome')),
            TextField(controller: unitController, decoration: const InputDecoration(labelText: 'Unidade')),
          ],
        ),
        actions: [
          TextButton(onPressed: () => Navigator.pop(context), child: const Text('Cancelar')),
          ElevatedButton(
            onPressed: () async {
              if (nameController.text.isNotEmpty) {
                await _repository.addProduct(nameController.text, unitController.text);
                _refreshProducts();
              }
              Navigator.pop(context);
            },
            child: const Text('Salvar'),
          ),
        ],
      ),
    );
  }

  void _showRecordPurchaseDialog(Artigo product) { // CORRIGIDO: Artigo
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
              if (qty > 0) {
                await _repository.recordPurchase(product.id, qty, price);
                _refreshProducts();
              }
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
      appBar: AppBar(title: const Text('Mercado Inteligente')),
      body: _products.isEmpty
          ? const Center(child: Text('Nenhum artigo cadastrado.'))
          : ListView.builder(
              itemCount: _products.length,
              itemBuilder: (context, index) {
                final product = _products[index];
                return Card(
                  child: ListTile(
                    title: Text(product.name),
                    subtitle: Text(product.suggestedQuantity != null 
                        ? 'Sugestão: ${product.suggestedQuantity!.toStringAsFixed(1)} ${product.unit}' 
                        : 'Sem histórico'),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        IconButton(icon: const Icon(Icons.shopping_cart, color: Colors.green), onPressed: () => _showRecordPurchaseDialog(product)),
                        IconButton(icon: const Icon(Icons.outbox, color: Colors.red), onPressed: () async {
                          await _repository.markAsFinished(product.id);
                          _refreshProducts();
                        }),
                      ],
                    ),
                  ),
                );
              },
            ),
      floatingActionButton: FloatingActionButton(onPressed: _showAddProductDialog, child: const Icon(Icons.add)),
    );
  }
}