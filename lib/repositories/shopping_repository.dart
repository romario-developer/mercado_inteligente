import 'package:hive/hive.dart';
import '../models/product.dart';
import '../models/purchase_item.dart';
import '../models/stock_event.dart';

class ShoppingRepository {
  // Acessa as boxes abertas no DatabaseService.init()
  Box<Artigo> get _artigos => Hive.box<Artigo>('artigos');
  Box<ItemCompra> get _itemCompras => Hive.box<ItemCompra>('itemCompras');
  Box<EventoStock> get _eventoStocks => Hive.box<EventoStock>('eventoStocks');

  Future<void> addProduct(String name, String unit) async {
    final product = Artigo(name: name, unit: unit);
    await _artigos.add(product);
  }

  Future<void> recordPurchase(dynamic productKey, double quantity, double price) async {
    final purchase = ItemCompra(
      artigoKey: productKey,
      quantity: quantity,
      price: price,
      date: DateTime.now(),
    );
    await _itemCompras.add(purchase);
  }

  Future<void> markAsFinished(dynamic productKey) async {
    final purchases = getPurchaseHistory(productKey);
    if (purchases.isEmpty) return;
    final lastPurchase = purchases.first;

    final event = EventoStock(
      artigoKey: productKey,
      dateFinished: DateTime.now(),
      quantityThatFinished: lastPurchase.quantity,
    );
    await _eventoStocks.add(event);

    await _updateProductPrediction(productKey, lastPurchase, event);
  }

  Future<void> _updateProductPrediction(dynamic productKey, ItemCompra lastPurchase, EventoStock event) async {
    final daysUsed = event.dateFinished.difference(lastPurchase.date).inDays;
    final duration = daysUsed > 0 ? daysUsed : 1;
    final double tcd = lastPurchase.quantity / duration; // taxa de consumo diário
    final suggested = tcd * 30;

    final product = _artigos.get(productKey);
    if (product != null) {
      product.suggestedQuantity = suggested;
      await product.save();
    }
  }

  List<Artigo> getAllProducts() {
    return _artigos.values.toList();
  }

  List<ItemCompra> getPurchaseHistory(dynamic productKey) {
    final list = _itemCompras.values.where((i) => i.artigoKey == productKey).toList();
    list.sort((a, b) => b.date.compareTo(a.date));
    return list;
  }

  List<EventoStock> getStockHistory(dynamic productKey) {
    final list = _eventoStocks.values.where((e) => e.artigoKey == productKey).toList();
    list.sort((a, b) => b.dateFinished.compareTo(a.dateFinished));
    return list;
  }
}
