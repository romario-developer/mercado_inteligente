import 'package:isar/isar.dart';
import '../database_service.dart';
import '../models/product.dart';
import '../models/purchase_item.dart';
import '../models/stock_event.dart';

class ShoppingRepository {
  // Acessa a instância do Isar que foi aberta no main.dart
  final isar = DatabaseService().isar;

  Future<void> addProduct(String name, String unit) async {
    // Usando o construtor com parâmetros obrigatórios conforme seu modelo
    final product = Artigo(name: name, unit: unit);
    
    await isar.writeTxn(() async {
      await isar.artigos.put(product);
    });
  }

  Future<void> recordPurchase(int productId, double quantity, double price) async {
    final purchase = ItemCompra(
      artigoKey: productId, // O erro indicou que o nome do parâmetro é artigoKey
      quantity: quantity,
      price: price,
      date: DateTime.now(),
    );

    await isar.writeTxn(() async {
      await isar.itemCompras.put(purchase);
    });
  }

  Future<void> markAsFinished(int productId) async {
    final lastPurchase = await isar.itemCompras
        .filter()
        .artigoKeyEqualTo(productId)
        .sortByDateDesc()
        .findFirst();

    if (lastPurchase == null) return;

    final event = EventoStock(
      artigoKey: productId,
      dateFinished: DateTime.now(),
      quantityThatFinished: lastPurchase.quantity,
    );

    await isar.writeTxn(() async {
      await isar.eventoStocks.put(event);
      await _updateProductPrediction(productId, lastPurchase, event);
    });
  }

  Future<void> _updateProductPrediction(int productId, ItemCompra lastPurchase, EventoStock event) async {
    final daysUsed = event.dateFinished.difference(lastPurchase.date).inDays;
    final duration = daysUsed > 0 ? daysUsed : 1;
    final double tcd = lastPurchase.quantity / duration;
    final suggested = tcd * 30;

    final product = await isar.artigos.get(productId);
    if (product != null) {
      product.suggestedQuantity = suggested;
      await isar.writeTxn(() async {
        await isar.artigos.put(product);
      });
    }
  }

  Future<List<Artigo>> getAllProducts() async {
    return await isar.artigos.where().findAll();
  }

  Future<List<ItemCompra>> getPurchaseHistory(int productId) async {
    return await isar.itemCompras
        .filter()
        .artigoKeyEqualTo(productId)
        .sortByDateDesc()
        .findAll();
  }

  Future<List<EventoStock>> getStockHistory(int productId) async {
    return await isar.eventoStocks
        .filter()
        .artigoKeyEqualTo(productId)
        .sortByDateFinishedDesc()
        .findAll();
  }
}