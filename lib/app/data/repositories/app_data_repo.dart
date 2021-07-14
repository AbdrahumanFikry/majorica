import 'package:bdaya_repository_pattern/bdaya_repository_pattern.dart';
import 'package:majorica/app/data/models/app_data.dart';
import 'package:majorica/app/data/models/app_links.dart';
import 'package:majorica/app/data/models/app_settings.dart';
import 'package:majorica/app/data/models/room_group.dart';
import 'package:majorica/app/data/models/room_package.dart';

class AppDataRepo extends ActiveRepo<String, AppData> {
  @override
  String get boxName => 'appData';

  Future<void> updateAppDataCache(Map<String, dynamic> response) async {
    final appData = AppData()
      ..appSettings = _mapAppSettings(response['appSettings'])
      ..roomPackages = _mapRoomPackages(response['roomPackages'])
      ..roomGroups = _mapRoomGroups(response['roomGroups']);
    await assignAll({'data': appData});
  }

  AppSettings? _mapAppSettings(Map<String, dynamic>? json) {
    if (json != null) {
      final appSettings = AppSettings();
      if (json['appBG'] != null) {
        appSettings.appBG = <String>[];
        json['appBG'].forEach((bg) {
          appSettings.appBG!.add(bg);
        });
      }
      if (json['appLinks'] != null) {
        final appLinks = AppLinks();
        appLinks.androidStore = json['appLinks']['androidStore'];
        appLinks.appleStore = json['appLinks']['appleStore'];
        appLinks.tOS = json['appLinks']['TOS'];
        appSettings.appLinks = appLinks;
      }
      if (json['contactus'] != null) {
        appSettings.contactUs = <String>[];
        json['contactus'].forEach((num) {
          appSettings.contactUs!.add(num);
        });
      }
      return appSettings;
    } else {
      return null;
    }
  }

  List<RoomPackage>? _mapRoomPackages(dynamic json) {
    if (json != null) {
      final roomPackagesList = <RoomPackage>[];
      json.forEach(
        (package) async {
          final roomPackage = RoomPackage()
            ..packageId = package['packageId']
            ..name = package['name']
            ..price = package['Price'];
          roomPackagesList.add(roomPackage);
        },
      );
      return roomPackagesList;
    } else {
      return null;
    }
  }

  List<RoomGroup>? _mapRoomGroups(dynamic json) {
    if (json != null) {
      final roomGroupsList = <RoomGroup>[];
      json.forEach(
        (group) {
          final roomGroup = RoomGroup()
            ..groupId = group['groupId']
            ..name = group['name']
            ..desc = group['desc']
            ..maxSleeps = group['maxSleeps'];
          if (group['images'] != null) {
            roomGroup.images = <String>[];
            for (final String img in group['images']) {
              roomGroup.images!.add(img);
            }
          }
          roomGroupsList.add(roomGroup);
        },
      );
      return roomGroupsList;
    } else {
      return null;
    }
  }
}
