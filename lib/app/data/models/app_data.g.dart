// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_data.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class AppDataAdapter extends TypeAdapter<AppData> {
  @override
  final int typeId = 4;

  @override
  AppData read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return AppData()
      ..appSettings = fields[2] as AppSettings?
      ..roomGroups = (fields[3] as List?)?.cast<RoomGroup>()
      ..roomPackages = (fields[4] as List?)?.cast<RoomPackage>()
      ..hash = fields[5] as String;
  }

  @override
  void write(BinaryWriter writer, AppData obj) {
    writer
      ..writeByte(4)
      ..writeByte(2)
      ..write(obj.appSettings)
      ..writeByte(3)
      ..write(obj.roomGroups)
      ..writeByte(4)
      ..write(obj.roomPackages)
      ..writeByte(5)
      ..write(obj.hash);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is AppDataAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
