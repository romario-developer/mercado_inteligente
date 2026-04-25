import 'package:hive/hive.dart';

part 'product.g.dart';

@HiveType(typeId: 0)
class Artigo extends HiveObject {
  @HiveField(0)
  String name;

  @HiveField(1)
  String unit;

  @HiveField(2)
  double? suggestedQuantity;

  Artigo({required this.name, required this.unit, this.suggestedQuantity});
}