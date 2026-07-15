import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../models/product.dart';
import '../repositories/shopping_repository.dart';

class ProductDetailScreen extends StatelessWidget {
  final Artigo product;
  final ShoppingRepository _repository = ShoppingRepository();

  ProductDetailScreen({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    final purchases = _repository.getPurchaseHistory(product.key);
    final events = _repository.getStockHistory(product.key);

    return Scaffold(
      appBar: AppBar(title: Text('Detalhes: ${product.name}')),
      body: Column(
        children: [
          _buildHeader(product),
          Expanded(
            child: ListView(
              children: [
                _sectionTitle('Histórico de Compras'),
                if (purchases.isEmpty)
                  _emptyRow('Nenhuma compra registrada.')
                else
                  ...purchases.map((p) => ListTile(
                        leading: const Icon(Icons.receipt_long, color: Colors.green),
                        title: Text('${p.quantity} ${product.unit}'),
                        subtitle: Text('Pago: R\$ ${p.price.toStringAsFixed(2)}'),
                        trailing: Text(DateFormat('dd/MM/yy').format(p.date)),
                      )),
                const Divider(),
                _sectionTitle('Histórico de Baixas'),
                if (events.isEmpty)
                  _emptyRow('Nenhuma baixa registrada.')
                else
                  ...events.map((e) => ListTile(
                        leading: const Icon(Icons.remove_shopping_cart, color: Colors.redAccent),
                        title: Text('Acabou: ${e.quantityThatFinished} ${product.unit}'),
                        trailing: Text(DateFormat('dd/MM/yy').format(e.dateFinished)),
                      )),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _sectionTitle(String text) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Align(
        alignment: Alignment.centerLeft,
        child: Text(text, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
      ),
    );
  }

  Widget _emptyRow(String text) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: Text(text, style: TextStyle(color: Colors.grey[600])),
    );
  }

  Widget _buildHeader(Artigo product) {
    return Container(
      width: double.infinity,
      color: Colors.green.withValues(alpha: 0.1),
      padding: const EdgeInsets.all(24),
      child: Column(
        children: [
          const Text("Estimativa de Consumo Mensal"),
          Text(
            product.suggestedQuantity != null
                ? '${product.suggestedQuantity!.toStringAsFixed(1)} ${product.unit}'
                : '--',
            style: const TextStyle(fontSize: 32, fontWeight: FontWeight.bold, color: Colors.green),
          ),
          Text("Baseado no seu histórico real",
            style: TextStyle(color: Colors.grey[600], fontSize: 12)),
        ],
      ),
    );
  }
}
