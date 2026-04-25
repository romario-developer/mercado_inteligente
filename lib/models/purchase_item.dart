import 'package:hive/hive.dart';

part 'purchase_item.g.dart';

@HiveType(typeId: 1)
class ItemCompra extends HiveObject {
  @HiveField(0)
  dynamic artigoKey;

  @HiveField(1)
  double quantity;

  @HiveField(2)
  double price;

  @HiveField(3)
  DateTime date;

  ItemCompra({required this.artigoKey, required this.quantity, required this.price, required this.date});
}