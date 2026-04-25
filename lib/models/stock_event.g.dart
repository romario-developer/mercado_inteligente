// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'stock_event.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class EventoStockAdapter extends TypeAdapter<EventoStock> {
  @override
  final int typeId = 2;

  @override
  EventoStock read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return EventoStock(
      artigoKey: fields[0] as dynamic,
      dateFinished: fields[1] as DateTime,
      quantityThatFinished: fields[2] as double,
    );
  }

  @override
  void write(BinaryWriter writer, EventoStock obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.artigoKey)
      ..writeByte(1)
      ..write(obj.dateFinished)
      ..writeByte(2)
      ..write(obj.quantityThatFinished);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is EventoStockAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
