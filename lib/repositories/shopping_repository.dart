import 'package:hive_flutter/hive_flutter.dart';
import '../models/product.dart';
import '../models/purchase_item.dart';
import '../models/stock_event.dart';

class ShoppingRepository {
  final boxArtigos = Hive.box<Artigo>('artigos');
  final boxCompras = Hive.box<ItemCompra>('itemCompras');
  final boxEventos = Hive.box<EventoStock>('eventoStocks');

  Future<void> addProduct(String name, String unit) async {
    final artigo = Artigo(name: name, unit: unit);
    await boxArtigos.add(artigo); // O Hive gera a key inteira automaticamente
  }

  Future<void> recordPurchase(dynamic artigoKey, double quantity, double price) async {
    final compra = ItemCompra(
      artigoKey: artigoKey,
      quantity: quantity,
      price: price,
      date: DateTime.now(),
    );
    await boxCompras.add(compra);
  }

  Future<void> markAsFinished(dynamic artigoKey) async {
    // Pega todas as compras do artigo e ordena da mais recente para a mais antiga
    final comprasDoArtigo = boxCompras.values.where((c) => c.artigoKey == artigoKey).toList();
    if (comprasDoArtigo.isEmpty) return;

    comprasDoArtigo.sort((a, b) => b.date.compareTo(a.date));
    final lastPurchase = comprasDoArtigo.first;

    final evento = EventoStock(
      artigoKey: artigoKey,
      dateFinished: DateTime.now(),
      quantityThatFinished: lastPurchase.quantity,
    );
    await boxEventos.add(evento);

    await _updateProductPrediction(artigoKey, lastPurchase, evento);
  }

  Future<void> _updateProductPrediction(dynamic artigoKey, ItemCompra lastPurchase, EventoStock event) async {
    final daysUsed = event.dateFinished.difference(lastPurchase.date).inDays;
    final duration = daysUsed > 0 ? daysUsed : 1;
    final double tcd = lastPurchase.quantity / duration;
    final suggested = tcd * 30;

    final artigo = boxArtigos.get(artigoKey);
    if (artigo != null) {
      artigo.suggestedQuantity = suggested;
      await artigo.save(); // A mágica do HiveObject: salva as alterações diretamente
    }
  }

  Future<List<Artigo>> getAllProducts() async {
    return boxArtigos.values.toList();
  }
}