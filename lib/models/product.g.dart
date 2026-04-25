// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ArtigoAdapter extends TypeAdapter<Artigo> {
  @override
  final int typeId = 0;

  @override
  Artigo read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Artigo(
      name: fields[0] as String,
      unit: fields[1] as String,
      suggestedQuantity: fields[2] as double?,
    );
  }

  @override
  void write(BinaryWriter writer, Artigo obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.name)
      ..writeByte(1)
      ..write(obj.unit)
      ..writeByte(2)
      ..write(obj.suggestedQuantity);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ArtigoAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
