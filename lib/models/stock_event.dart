import 'package:hive/hive.dart';

part 'stock_event.g.dart';

@HiveType(typeId: 2)
class EventoStock extends HiveObject {
  @HiveField(0)
  dynamic artigoKey;

  @HiveField(1)
  DateTime dateFinished;

  @HiveField(2)
  double quantityThatFinished;

  EventoStock({required this.artigoKey, required this.dateFinished, required this.quantityThatFinished});
}