import 'package:isar/isar.dart';

part 'stock_event.g.dart';

@collection
class StockEvent {
  Id id = Isar.autoIncrement;
  
  late int productId;
  late DateTime dateFinished;
  
  // Quantidade que havia sido comprada e que acabou nesta data
  late double quantityThatFinished; 
}