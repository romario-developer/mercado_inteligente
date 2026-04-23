import 'package:isar/isar.dart';
import '../database_service.dart';
import '../models/product.dart';
import '../models/purchase_item.dart';
import '../models/stock_event.dart';

class ShoppingRepository {
  final isar = DatabaseService().isar;

  // Adicionar um novo produto ao catálogo
  Future<void> addProduct(String name, String unit) async {
    final product = Produto() // Nome da classe atualizado
      ..name = name
      ..unit = unit;
    
    await isar.writeTxn(() async {
      await isar.produtos.put(product); // Coleção é .produtos (minúsculo)
    });
  }

  // Registrar uma nova compra
  Future<void> recordPurchase(int productId, double quantity, double price) async {
    final purchase = ItemCompra() // Nome da classe atualizado
      ..productId = productId
      ..quantity = quantity
      ..price = price
      ..date = DateTime.now();

    await isar.writeTxn(() async {
      await isar.itemCompras.put(purchase); // Coleção é .itemCompras
    });
  }

  // Marcar que um produto acabou HOJE
  Future<void> markAsFinished(int productId) async {
    // Buscar a última compra
    final lastPurchase = await isar.itemCompras
        .filter()
        .productIdEqualTo(productId)
        .sortByDateDesc()
        .findFirst();

    if (lastPurchase == null) return;

    final event = EventoStock() // Nome da classe atualizado
      ..productId = productId
      ..dateFinished = DateTime.now()
      ..quantityThatFinished = lastPurchase.quantity;

    await isar.writeTxn(() async {
      await isar.eventoStocks.put(event); // Coleção é .eventoStocks
      
      // Atualizar a predição
      await _updateProductPrediction(productId, lastPurchase, event);
    });
  }

  // O Cérebro: Cálculo de Predição
  Future<void> _updateProductPrediction(int productId, ItemCompra lastPurchase, EventoStock event) async {
    final daysUsed = event.dateFinished.difference(lastPurchase.date).inDays;
    final duration = daysUsed > 0 ? daysUsed : 1;
    final double tcd = lastPurchase.quantity / duration;
    final suggested = tcd * 30;

    final product = await isar.produtos.get(productId);
    if (product != null) {
      product.suggestedQuantity = suggested;
      await isar.writeTxn(() async {
        await isar.produtos.put(product);
      });
    }
  }

  Future<List<Produto>> getAllProducts() async {
    return await isar.produtos.where().findAll();
  }
}