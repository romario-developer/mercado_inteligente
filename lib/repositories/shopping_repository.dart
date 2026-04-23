import 'package:isar/isar.dart';
import '../database_service.dart';
import '../models/product.dart';
import '../models/purchase_item.dart';
import '../models/stock_event.dart';

class ShoppingRepository {
  final isar = DatabaseService().isar;

  // Adicionar um novo artigo ao catálogo
  Future<void> addProduct(String name, String unit) async {
    final product = Artigo() // CORRIGIDO: Nome da classe
      ..name = name
      ..unit = unit;
    
    await isar.writeTxn(() async {
      await isar.artigos.put(product); // CORRIGIDO: nome da coleção
    });
  }

  // Registrar uma nova compra
  Future<void> recordPurchase(int productId, double quantity, double price) async {
    final purchase = ItemCompra()
      ..productId = productId
      ..quantity = quantity
      ..price = price
      ..date = DateTime.now();

    await isar.writeTxn(() async {
      await isar.itemCompras.put(purchase);
    });
  }

  // Marcar que um produto acabou
  Future<void> markAsFinished(int productId) async {
    final lastPurchase = await isar.itemCompras
        .filter()
        .productIdEqualTo(productId)
        .sortByDateDesc()
        .findFirst();

    if (lastPurchase == null) return;

    final event = EventoStock()
      ..productId = productId
      ..dateFinished = DateTime.now()
      ..quantityThatFinished = lastPurchase.quantity;

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

    final product = await isar.artigos.get(productId); // CORRIGIDO: coleção artigos
    if (product != null) {
      product.suggestedQuantity = suggested;
      await isar.writeTxn(() async {
        await isar.artigos.put(product); // CORRIGIDO: coleção artigos
      });
    }
  }

  Future<List<Artigo>> getAllProducts() async { // CORRIGIDO: Tipo de retorno
    return await isar.artigos.where().findAll(); // CORRIGIDO: coleção artigos
  }
}