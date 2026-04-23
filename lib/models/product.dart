// ignore_for_file: type=lint
import 'package:isar/isar.dart';

part 'product.g.dart';

@collection
class Produto { // Mudei o nome aqui
  Id id = Isar.autoIncrement;

  @Index(unique: true)
  late String name;
  
  late String unit;

  double? suggestedQuantity;
}