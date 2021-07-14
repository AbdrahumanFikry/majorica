// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'room_package.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class RoomPackageAdapter extends TypeAdapter<RoomPackage> {
  @override
  final int typeId = 2;

  @override
  RoomPackage read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return RoomPackage()
      ..packageId = fields[1] as int?
      ..name = fields[2] as String?
      ..price = fields[3] as int?;
  }

  @override
  void write(BinaryWriter writer, RoomPackage obj) {
    writer
      ..writeByte(3)
      ..writeByte(1)
      ..write(obj.packageId)
      ..writeByte(2)
      ..write(obj.name)
      ..writeByte(3)
      ..write(obj.price);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is RoomPackageAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
