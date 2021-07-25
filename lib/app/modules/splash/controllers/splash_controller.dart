import 'package:bdaya_fcm_handler/bdaya_fcm_handler.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:majorica/app/routes/app_pages.dart';
import 'package:majorica/app/services/analytics_service.dart';
import 'package:majorica/app/services/auth_service.dart';
import 'package:majorica/app/services/cache_service.dart';
import 'package:majorica/app/services/notification_service.dart';
import 'package:majorica/app/utilities/app_util.dart';
import 'package:majorica/generated/l10n.dart';
import 'package:hive_flutter/hive_flutter.dart';

class SplashController extends GetxController {
  Future<bool> _initCache() async {
    await Hive.initFlutter('v1');
    await (Get.put(CacheService())).init();
    return CacheService.to.userRepo.initAuthLogic();
  }

  Future<String> initFunction(BuildContext context) async {
    try {
      await Firebase.initializeApp();
      fcmServiceFinder =
          () => Get.isRegistered<FCMService>() ? Get.find<FCMService>() : null;
      final RemoteMessage? msg =
          await Get.put(FCMService(), permanent: true).doInit(
        requestFunc: () async {
          final settings = await FirebaseMessaging.instance.requestPermission();
          return settings;
        },
        platform: Theme.of(context).platform,
      );
      final authLogicRes = await _initCache();
      Get.put<AuthService>(AuthService());
      Get.put(NotificationService()).init();
      if (msg != null) {
        print(msg.notification.toString());
        Get.find<NotificationService>().handleMessages(
          NotificationSource.OnMessageOpenedApp,
          msg,
        );
      }
      final String authRoute =
          authLogicRes == true ? Routes.ROOT : Routes.ACCOUNT;
      return authRoute;
    } catch (e) {
      AppUtil.showAlertDialog(
        title: S.current.alert,
        contentText: e.toString(),
      );
      rethrow;
    }
  }
}
