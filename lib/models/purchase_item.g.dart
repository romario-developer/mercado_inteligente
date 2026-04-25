// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'purchase_item.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ItemCompraAdapter extends TypeAdapter<ItemCompra> {
  @override
  final int typeId = 1;

  @override
  ItemCompra read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ItemCompra(
      artigoKey: fields[0] as dynamic,
      quantity: fields[1] as double,
      price: fields[2] as double,
      date: fields[3] as DateTime,
    );
  }

  @override
  void write(BinaryWriter writer, ItemCompra obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.artigoKey)
      ..writeByte(1)
      ..write(obj.quantity)
      ..writeByte(2)
      ..write(obj.price)
      ..writeByte(3)
      ..write(obj.date);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ItemCompraAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
