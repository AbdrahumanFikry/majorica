import 'package:bdaya_repository_pattern/bdaya_repository_pattern.dart';
import 'package:majorica/app/data/models/room_group.dart';
import 'package:majorica/app/data/models/room_package.dart';
import '_hive_type_ids.dart';
import 'app_settings.dart';

part 'app_data.g.dart';

@HiveType(typeId: appDataTypeId)
class AppData extends HiveObject {
  // @HiveField(1)
  // late User? user;

  @HiveField(2)
  late AppSettings? appSettings;

  @HiveField(3)
  late List<RoomGroup>? roomGroups;

  @HiveField(4)
  late List<RoomPackage>? roomPackages;
}
