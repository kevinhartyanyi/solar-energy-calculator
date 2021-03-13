// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'calculation_item.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class CalculationItemAdapter extends TypeAdapter<CalculationItem> {
  @override
  final int typeId = 0;

  @override
  CalculationItem read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return CalculationItem(
      fields[0] as SolarData,
      fields[1] as int,
      fields[2] as DateTime,
      fields[3] as DateTime,
      fields[4] as double,
      fields[5] as double,
      fields[6] as String,
    );
  }

  @override
  void write(BinaryWriter writer, CalculationItem obj) {
    writer
      ..writeByte(7)
      ..writeByte(0)
      ..write(obj.solarData)
      ..writeByte(1)
      ..write(obj.solarPanelAmount)
      ..writeByte(2)
      ..write(obj.instalment)
      ..writeByte(3)
      ..write(obj.end)
      ..writeByte(4)
      ..write(obj.electricityPrice)
      ..writeByte(5)
      ..write(obj.costs)
      ..writeByte(6)
      ..write(obj.name);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CalculationItemAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
