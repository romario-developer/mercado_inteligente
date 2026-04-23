import 'package:isar/isar.dart';
import '../database_service.dart';
import '../models/product.dart';
import '../models/purchase_item.dart';
import '../models/stock_event.dart';

class ShoppingRepository {
  final isar = DatabaseService().isar;

  // Adicionar um novo produto ao catálogo
  Future<void> addProduct(String name, String unit) async {
    final product = Product()
      ..name = name
      ..unit = unit;
    
    await isar.writeTxn(() async {
      await isar.products.put(product);
    });
  }

  // Registrar uma nova compra
  Future<void> recordPurchase(int productId, double quantity, double price) async {
    final purchase = PurchaseItem()
      ..productId = productId
      ..quantity = quantity
      ..price = price
      ..date = DateTime.now();

    await isar.writeTxn(() async {
      await isar.purchaseItems.put(purchase);
    });
  }

  // Marcar que um produto acabou HOJE
  Future<void> markAsFinished(int productId) async {
    // 1. Buscar a última compra desse produto para saber a quantidade que acabou
    final lastPurchase = await isar.purchaseItems
        .filter()
        .productIdEqualTo(productId)
        .sortByDateDesc()
        .findFirst();

    if (lastPurchase == null) return;

    final event = StockEvent()
      ..productId = productId
      ..dateFinished = DateTime.now()
      ..quantityThatFinished = lastPurchase.quantity;

    await isar.writeTxn(() async {
      await isar.stockEvents.put(event);
      
      // Atualizar a sugestão inteligente para o produto
      await _updateProductPrediction(productId, lastPurchase, event);
    });
  }

  // O Cérebro: Cálculo de Predição
  Future<void> _updateProductPrediction(int productId, PurchaseItem lastPurchase, StockEvent event) async {
    final daysUsed = event.dateFinished.difference(lastPurchase.date).inDays;
    
    // Evitar divisão por zero se marcou no mesmo dia
    final duration = daysUsed > 0 ? daysUsed : 1;
    
    // Taxa de Consumo Diário (TCD)
    final double tcd = lastPurchase.quantity / duration;

    // Sugestão para os próximos 30 dias
    final suggested = tcd * 30;

    final product = await isar.products.get(productId);
    if (product != null) {
      product.suggestedQuantity = suggested;
      await isar.products.put(product);
    }
  }

  // Buscar todos os produtos com suas predições
  Future<List<Product>> getAllProducts() async {
    return await isar.products.where().findAll();
  }
}