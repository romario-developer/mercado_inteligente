// ignore_for_file: type=lint
import 'package:isar/isar.dart';

part 'stock_event.g.dart';

@collection
class EventoStock { // Mudei o nome aqui
  Id id = Isar.autoIncrement;
  
  late int productId;
  late DateTime dateFinished;
  late double quantityThatFinished; 
}