// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_links.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class AppLinksAdapter extends TypeAdapter<AppLinks> {
  @override
  final int typeId = 5;

  @override
  AppLinks read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return AppLinks()
      ..androidStore = fields[1] as String?
      ..appleStore = fields[2] as String?
      ..tOS = fields[3] as String?;
  }

  @override
  void write(BinaryWriter writer, AppLinks obj) {
    writer
      ..writeByte(3)
      ..writeByte(1)
      ..write(obj.androidStore)
      ..writeByte(2)
      ..write(obj.appleStore)
      ..writeByte(3)
      ..write(obj.tOS);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is AppLinksAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
