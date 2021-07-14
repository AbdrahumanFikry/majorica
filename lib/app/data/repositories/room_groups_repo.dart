import 'package:bdaya_repository_pattern/bdaya_repository_pattern.dart';
import 'package:majorica/app/data/models/room_group.dart';

class RoomGroupsRepo extends ActiveRepo<int, RoomGroup> {
  @override
  String get boxName => 'roomGroups';

  Future<RoomGroup> updateRoomGroupsCache(Map<String, dynamic> json) async {
    final roomGroup = RoomGroup()
      ..groupId = json['groupId']
      ..name = json['name']
      ..desc = json['desc']
      ..maxSleeps = json['maxSleeps'];
    if (json['roomPackages'] != null) {
      roomGroup.images = <String>[];
      json['roomPackages'].forEach((v) {
        roomGroup.images!.add(v);
      });
    }
    await put(roomGroup.groupId!, roomGroup);
    return roomGroup;
  }
}
