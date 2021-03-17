// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'solar_data.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class SolarDataAdapter extends TypeAdapter<SolarData> {
  @override
  final int typeId = 1;

  @override
  SolarData read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return SolarData(
      latitude: fields[0] as double,
      longitude: fields[1] as double,
      elevation: fields[2] as double,
      peakpower: fields[3] as double,
      systemLoss: fields[4] as double,
      technology: fields[5] as String,
      avgMonthlyEnergy: (fields[6] as List)?.cast<double>(),
    );
  }

  @override
  void write(BinaryWriter writer, SolarData obj) {
    writer
      ..writeByte(7)
      ..writeByte(0)
      ..write(obj.latitude)
      ..writeByte(1)
      ..write(obj.longitude)
      ..writeByte(2)
      ..write(obj.elevation)
      ..writeByte(3)
      ..write(obj.peakpower)
      ..writeByte(4)
      ..write(obj.systemLoss)
      ..writeByte(5)
      ..write(obj.technology)
      ..writeByte(6)
      ..write(obj.avgMonthlyEnergy);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is SolarDataAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
