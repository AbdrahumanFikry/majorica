import 'package:majorica/app/data/models/user.dart';
import 'package:majorica/app/data/repositories/settings_repo.dart';
import 'package:get/get.dart';
import 'package:bdaya_repository_pattern/bdaya_repository_pattern.dart';
import 'package:majorica/app/data/repositories/user_repo.dart';

class CacheService extends CacheServiceInterface with GetxServiceMixin {
  static CacheService get to => Get.find();

  late UserRepo _userRepo;
  late SettingsRepo _settingsRepo;

  UserRepo get userRepo => _userRepo;

  SettingsRepo get settingsRepo => _settingsRepo;

  @override
  Future<void> initRepos() async {
    await (_userRepo = UserRepo()).init();
    await (_settingsRepo = SettingsRepo()).init();
  }

  @override
  void registerTypeAdapters() {
    Hive.registerAdapter(UserAdapter());
  }
}
