import 'package:hive_flutter/hive_flutter.dart';
import 'models/product.dart';
import 'models/purchase_item.dart';
import 'models/stock_event.dart';

class DatabaseService {
  static final DatabaseService _instance = DatabaseService._internal();
  factory DatabaseService() => _instance;
  DatabaseService._internal();

  Future<void> init() async {
    // Inicializa o Hive focado no ambiente que estiver rodando (Web ou Mobile)
    await Hive.initFlutter();
    
    // Registra os adaptadores gerados
    Hive.registerAdapter(ArtigoAdapter());
    Hive.registerAdapter(ItemCompraAdapter());
    Hive.registerAdapter(EventoStockAdapter());

    // Abre as "caixas" (equivalente às coleções)
    await Hive.openBox<Artigo>('artigos');
    await Hive.openBox<ItemCompra>('itemCompras');
    await Hive.openBox<EventoStock>('eventoStocks');
  }
}