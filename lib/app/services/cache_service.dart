import 'package:majorica/app/data/models/app_data.dart';
import 'package:majorica/app/data/models/app_links.dart';
import 'package:majorica/app/data/models/room_group.dart';
import 'package:majorica/app/data/models/room_package.dart';
import 'package:majorica/app/data/models/user.dart';
import 'package:majorica/app/data/repositories/app_data_repo.dart';
import 'package:majorica/app/data/repositories/settings_repo.dart';
import 'package:get/get.dart';
import 'package:bdaya_repository_pattern/bdaya_repository_pattern.dart';
import 'package:majorica/app/data/repositories/user_repo.dart';

class CacheService extends CacheServiceInterface with GetxServiceMixin {
  static CacheService get to => Get.find();

  late UserRepo _userRepo;
  late SettingsRepo _settingsRepo;
  late AppDataRepo _appDataRepo;

  UserRepo get userRepo => _userRepo;

  SettingsRepo get settingsRepo => _settingsRepo;

  AppDataRepo get appDataRepo => _appDataRepo;

  @override
  Future<void> initRepos() async {
    await (_userRepo = UserRepo()).init();
    await (_settingsRepo = SettingsRepo()).init();
    await (_appDataRepo = AppDataRepo()).init();
  }

  @override
  void registerTypeAdapters() {
    Hive.registerAdapter(UserAdapter());
    Hive.registerAdapter(RoomGroupAdapter());
    Hive.registerAdapter(RoomPackageAdapter());
    Hive.registerAdapter(AppLinksAdapter());
    Hive.registerAdapter(AppDataAdapter());
  }
}
