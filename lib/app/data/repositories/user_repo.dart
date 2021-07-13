import 'package:bdaya_repository_pattern/bdaya_repository_pattern.dart';
import 'package:majorica/app/data/models/loaded_data.dart';
import 'package:majorica/app/data/models/user.dart';
import 'package:majorica/app/services/auth_service.dart';

class UserRepo extends ActiveRepo<String, User> {
  @override
  String get boxName => 'users';

  static UserViewModel mapFromUserInfo(User user) {
    return UserViewModel(
      name: user.name,
      payBalance: user.payBalance,
      points: user.points,
    );
  }

  Future<void> updateUserCache(
      AppLoadedData appLoadedData, String sessionID) async {
    final user = User()
      ..name = appLoadedData.user!.name!
      ..payBalance = appLoadedData.user!.payBalance!
      ..points = appLoadedData.user!.points!
      ..sessionID = sessionID;
    await assignAll({user.sessionID: user});
  }

  Future<bool> initAuthLogic() async {
    final info = firstOrNull;
    if (info == null) {
      return false;
    } else {
      final User user = firstOrNull!.value;
      await AuthService.to.loadApp(localSession: user.sessionID);
      return user.sessionID.isNotEmpty;
    }
  }
}
