import 'package:isar/isar.dart';

part 'product.g.dart';

@collection
class Product {
  Id id = Isar.autoIncrement;

  @Index(unique: true)
  late String name;
  
  late String unit; // ex: kg, un, pacote

  // Campo para armazenar a sugestão inteligente calculada
  double? suggestedQuantity;
}