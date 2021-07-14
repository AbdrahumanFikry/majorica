import 'package:bdaya_repository_pattern/bdaya_repository_pattern.dart';
import 'package:majorica/app/data/models/room_package.dart';

class RoomPackagesRepo extends ActiveRepo<int, RoomPackage> {
  @override
  String get boxName => 'roomPackages';

  Future<RoomPackage> updateRoomPackagesCache(Map<String, dynamic> json) async {
    final roomPackage = RoomPackage()
      ..packageId = json['packageId']
      ..name = json['name']
      ..price = json['Price'];
    await put(roomPackage.packageId!, roomPackage);
    return roomPackage;
  }
}
