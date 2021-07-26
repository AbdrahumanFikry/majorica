import 'dart:convert';

import 'package:bdaya_repository_pattern/bdaya_repository_pattern.dart';
import 'package:majorica/app/data/models/user.dart';
import 'package:majorica/app/services/auth_service.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class UserRepo extends ActiveRepo<String, User> {
  @override
  String get boxName => 'users';

  final FlutterSecureStorage secureStorage = const FlutterSecureStorage();

  @override
  Future<void> init({HiveAesCipher? hiveAesCipher}) async {
    final bool containsEncryptionKey =
        await secureStorage.containsKey(key: 'key');
    if (!containsEncryptionKey) {
      final key = Hive.generateSecureKey();
      await secureStorage.write(key: 'key', value: base64UrlEncode(key));
    }
    final encryptionKey =
        base64Url.decode((await secureStorage.read(key: 'key'))!);
    print('Encryption key: $encryptionKey');
    return super.init(hiveAesCipher: HiveAesCipher(encryptionKey));
  }

  Future<void> updateUserCache(
      Map<String, dynamic> json, String sessionID) async {
    final user = User()
      ..name = json['name']
      ..payBalance = json['payBalance']
      ..points = json['points']
      ..sessionID = sessionID;
    AuthService.to.currentUser(user);
    await assignAll({sessionID: user});
  }

  Future<bool> initAuthLogic() async {
    final info = firstOrNull;
    if (info == null) {
      return false;
    } else {
      final User user = firstOrNull!.value;
      return user.sessionID.isNotEmpty;
    }
  }
}
