import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../models/product.dart';
import '../models/purchase_item.dart';
import '../models/stock_event.dart';
import '../repositories/shopping_repository.dart';

class ProductDetailScreen extends StatelessWidget {
  final Artigo product;
  final ShoppingRepository _repository = ShoppingRepository();

  ProductDetailScreen({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Detalhes: ${product.name}')),
      body: FutureBuilder(
        future: Future.wait([
          _repository.getPurchaseHistory(product.id),
          _repository.getStockHistory(product.id),
        ]),
        builder: (context, snapshot) {
          if (!snapshot.hasData) return const Center(child: CircularProgressIndicator());

          final purchases = snapshot.data![0] as List<ItemCompra>;
          final events = snapshot.data![1] as List<EventoStock>;

          return Column(
            children: [
              _buildHeader(product),
              const Padding(
                padding: EdgeInsets.all(16.0),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text("Histórico de Compras", 
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                ),
              ),
              Expanded(
                child: purchases.isEmpty 
                  ? const Center(child: Text("Nenhuma compra registrada."))
                  : ListView.builder(
                    itemCount: purchases.length,
                    itemBuilder: (context, index) {
                      final p = purchases[index];
                      return ListTile(
                        leading: const Icon(Icons.receipt_long, color: Colors.green),
                        title: Text('${p.quantity} ${product.unit}'),
                        subtitle: Text('Pago: R\$ ${p.price.toStringAsFixed(2)}'),
                        trailing: Text(DateFormat('dd/MM/yy').format(p.date)),
                      );
                    },
                  ),
              ),
            ],
          );
        },
      ),
    );
  }

  Widget _buildHeader(Artigo product) {
    return Container(
      width: double.infinity,
      color: Colors.green.withOpacity(0.1),
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