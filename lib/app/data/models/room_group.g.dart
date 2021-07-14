// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'room_group.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class RoomGroupAdapter extends TypeAdapter<RoomGroup> {
  @override
  final int typeId = 1;

  @override
  RoomGroup read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return RoomGroup()
      ..groupId = fields[1] as int?
      ..name = fields[2] as String?
      ..desc = fields[3] as String?
      ..maxSleeps = fields[4] as int?
      ..images = (fields[5] as List?)?.cast<String>();
  }

  @override
  void write(BinaryWriter writer, RoomGroup obj) {
    writer
      ..writeByte(5)
      ..writeByte(1)
      ..write(obj.groupId)
      ..writeByte(2)
      ..write(obj.name)
      ..writeByte(3)
      ..write(obj.desc)
      ..writeByte(4)
      ..write(obj.maxSleeps)
      ..writeByte(5)
      ..write(obj.images);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is RoomGroupAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
