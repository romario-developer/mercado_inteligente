// ignore_for_file: type=lint
import 'package:isar/isar.dart';

part 'purchase_item.g.dart';

@collection
class ItemCompra { // Mudei o nome aqui
  Id id = Isar.autoIncrement;
  
  late int productId;
  late double quantity;
  late double price;
  late DateTime date;
}