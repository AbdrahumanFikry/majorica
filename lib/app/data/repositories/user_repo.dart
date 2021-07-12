// import 'dart:convert';
//
// import 'package:bdaya_repository_pattern/bdaya_repository_pattern.dart';
// import 'package:enum_to_string/enum_to_string.dart';
// import 'package:fawater/app/data/models/user.dart';
// import 'package:fawater/app/data/models/app_loaded_data.dart';
// import '../enums/user_type.dart';
// import 'package:fawater/app/services/auth_service.dart';
// import 'package:flutter_secure_storage/flutter_secure_storage.dart';
//
// class UserRepo extends ActiveRepo<String, User> {
//
//   @override
//   String get boxName => 'users';
//
//   static AppLoadedData mapFromUserInfo(User user) {
//     return AppLoadedData(
//       user: UserViewModel(
//         name: user.username,
//         type: int.tryParse(
//           EnumToString.convertToString(user.userType),
//         ),
//         balance: user.balance,
//         fingerprint: user.fingerprint,
//         sessionID: user.sessionID,
//       ),
//       monthlyTarget: user.monthlyTarget,
//       forcePasswordChange: user.forcePasswordChange,
//       servicesHash: user.servicesHash,
//     );
//   }
//
//   Future<void> updateUserCache(AppLoadedData appLoadedData) async {
//     final user = User()
//       ..username = appLoadedData.user!.name!
//       ..userType = typeFromApiRole(appLoadedData.user!.type!)!
//       ..balance = appLoadedData.user!.balance!
//       ..monthlyTarget = appLoadedData.monthlyTarget
//       ..forcePasswordChange = appLoadedData.forcePasswordChange
//       ..servicesHash = appLoadedData.servicesHash
//       ..fingerprint = appLoadedData.user!.fingerprint!
//       ..sessionID = appLoadedData.user!.sessionID!;
//     await assignAll({user.fingerprint: user});
//   }
//
//   Future<bool> initAuthLogic() async {
//     final info = firstOrNull;
//     if (info == null) {
//       return false;
//     } else {
//       final User user = firstOrNull!.value;
//       return user.fingerprint.isNotEmpty && user.sessionID.isNotEmpty;
//     }
//   }
//
//   Future<void> updateBalance(double newBalance) async {
//     try {
//       final info = firstOrNull;
//       if (info != null) {
//         final User user = firstOrNull!.value;
//         print('User old balance : ${user.balance}');
//         user.balance = newBalance;
//         await put(user.fingerprint, user);
//         print('User new balance : ${user.balance}');
//       }
//     } catch (error) {
//       print('Error adding new balance : $error');
//       AuthService.to.loadApp();
//     }
//   }
//
//   Future<void> signOutAndRemoveSessionID() async {
//     try {
//       final info = firstOrNull;
//       if (info != null) {
//         final User user = firstOrNull!.value;
//         user.sessionID = '';
//         await put(user.fingerprint, user);
//       }
//     } catch (error) {
//       print('Error deleting user session : $error');
//     }
//   }
// }
