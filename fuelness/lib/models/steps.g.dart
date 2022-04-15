// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'steps.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class StepsAdapter extends TypeAdapter<Steps> {
  @override
  final int typeId = 1;

  @override
  Steps read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Steps(
      fields[0] as DateTime,
      fields[1] as int,
    )
      .._calories = fields[2] as double?
      .._km = fields[3] as double?;
  }

  @override
  void write(BinaryWriter writer, Steps obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj._date)
      ..writeByte(1)
      ..write(obj.numberOfSteps)
      ..writeByte(2)
      ..write(obj._calories)
      ..writeByte(3)
      ..write(obj._km);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is StepsAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
