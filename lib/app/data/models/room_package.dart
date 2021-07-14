import 'package:bdaya_repository_pattern/bdaya_repository_pattern.dart';
import '_hive_type_ids.dart';

part 'room_package.g.dart';

@HiveType(typeId: roomPackageTypeId)
class RoomPackage extends HiveObject {
  @HiveField(1)
  int? packageId;

  @HiveField(2)
  String? name;

  @HiveField(3)
  int? price;
}
