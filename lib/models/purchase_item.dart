import 'package:isar/isar.dart';

part 'purchase_item.g.dart';

@collection
class PurchaseItem {
  Id id = Isar.autoIncrement;
  
  late int productId;
  late double quantity;
  late double price;
  late DateTime date;
}