import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';
import 'package:flutter/foundation.dart' show kIsWeb; // Importante: permite saber se estamos na Web
import 'models/product.dart';
import 'models/purchase_item.dart';
import 'models/stock_event.dart';

class DatabaseService {
  late Isar isar;

  static final DatabaseService _instance = DatabaseService._internal();
  factory DatabaseService() => _instance;
  DatabaseService._internal();

  Future<void> init() async {
    String dirPath = '';

    // Só busca o diretório físico se NÃO estiver rodando na Web
    if (!kIsWeb) {
      final dir = await getApplicationDocumentsDirectory();
      dirPath = dir.path;
    }

    // Inicializa o banco de dados
    isar = await Isar.open(
      [ArtigoSchema, ItemCompraSchema, EventoStockSchema],
      // Na Web, o Isar ignora essa string e usa o IndexedDB do navegador automaticamente
      directory: dirPath, 
    );
  }
}