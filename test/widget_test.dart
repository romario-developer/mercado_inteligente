import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:hive/hive.dart';
import 'package:mercado_inteligente/main.dart';
import 'package:mercado_inteligente/models/product.dart';
import 'package:mercado_inteligente/models/purchase_item.dart';
import 'package:mercado_inteligente/models/stock_event.dart';

void main() {
  late Directory tempDir;

  setUp(() async {
    tempDir = await Directory.systemTemp.createTemp('hive_test');
    Hive.init(tempDir.path);
    if (!Hive.isAdapterRegistered(0)) Hive.registerAdapter(ArtigoAdapter());
    if (!Hive.isAdapterRegistered(1)) Hive.registerAdapter(ItemCompraAdapter());
    if (!Hive.isAdapterRegistered(2)) Hive.registerAdapter(EventoStockAdapter());
    await Hive.openBox<Artigo>('artigos');
    await Hive.openBox<ItemCompra>('itemCompras');
    await Hive.openBox<EventoStock>('eventoStocks');
  });

  tearDown(() async {
    await Hive.deleteFromDisk();
    await tempDir.delete(recursive: true);
  });

  testWidgets('App smoke test', (WidgetTester tester) async {
    await tester.pumpWidget(const MercadoInteligente());

    // AppBar exibe o título do app
    expect(find.text('🛒 Mercado Inteligente'), findsOneWidget);
    // Despensa vazia mostra a mensagem inicial
    expect(find.text('Nenhum item na sua despensa.'), findsOneWidget);
  });
}
