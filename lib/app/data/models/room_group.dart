import 'package:bdaya_repository_pattern/bdaya_repository_pattern.dart';
import '_hive_type_ids.dart';

part 'room_group.g.dart';

@HiveType(typeId: roomGroupTypeId)
class RoomGroup extends HiveObject {
  @HiveField(1)
  late int? groupId;

  @HiveField(2)
  late String? name;

  @HiveField(3)
  late String? desc;

  @HiveField(4)
  late int? maxSleeps;

  @HiveField(5)
  List<String?>? images;
}
