import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';
import 'models/product.dart';
import 'models/purchase_item.dart';
import 'models/stock_event.dart';

class DatabaseService {
  late Isar isar;

  static final DatabaseService _instance = DatabaseService._internal();
  factory DatabaseService() => _instance;
  DatabaseService._internal();

  Future<void> init() async {
    final dir = await getApplicationDocumentsDirectory();
    
    isar = await Isar.open(
      [ProdutoSchema, ItemCompraSchema, EventoStockSchema], // NOMES NOVOS AQUI
      directory: dir.path,
    );
  }
}