import 'package:bdaya_repository_pattern/bdaya_repository_pattern.dart';
import 'package:majorica/app/data/models/user.dart';

class UserRepo extends ActiveRepo<String, User> {
  @override
  String get boxName => 'users';

  Future<void> updateUserCache(
      Map<String, dynamic> json, String sessionID) async {
    final user = User()
      ..name = json['name']
      ..payBalance = json['payBalance']
      ..points = json['points']
      ..sessionID = sessionID;
    await assignAll({user.sessionID: user});
  }

  Future<bool> initAuthLogic() async {
    final info = firstOrNull;
    print('::::::::::::::::::::::::::::$info');
    if (info == null) {
      return false;
    } else {
      final User user = firstOrNull!.value;
      return user.sessionID.isNotEmpty;
    }
  }
}
