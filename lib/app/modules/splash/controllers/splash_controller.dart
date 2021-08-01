import 'package:bdaya_fcm_handler/bdaya_fcm_handler.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:majorica/app/routes/app_pages.dart';
import 'package:majorica/app/services/auth_service.dart';
import 'package:majorica/app/services/cache_service.dart';
import 'package:majorica/app/services/notification_service.dart';
import 'package:majorica/app/utilities/app_util.dart';
import 'package:majorica/app/utilities/mixins/api_mixin.dart';
import 'package:majorica/generated/l10n.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:stack_trace/stack_trace.dart';

class SplashController extends GetxController with ApiMixin {
  Future<bool> _initCache() async {
    try {
      await Hive.initFlutter('v2');
      await (Get.put(CacheService())).init();
      Get.put<AuthService>(AuthService());
      return CacheService.to.userRepo.initAuthLogic();
    } catch (e) {
      rethrow;
    }
  }

  Future<String> initFunction(BuildContext context) async {
    try {
      return Chain.capture(() async {
        await Firebase.initializeApp();
        FlutterError.onError = FirebaseCrashlytics.instance.recordFlutterError;
        fcmServiceFinder = () =>
            Get.isRegistered<FCMService>() ? Get.find<FCMService>() : null;
        final RemoteMessage? msg =
            await Get.put(FCMService(), permanent: true).doInit(
          requestFunc: () async {
            final settings =
                await FirebaseMessaging.instance.requestPermission();
            return settings;
          },
          platform: Theme.of(context).platform,
        );
        final authLogicRes = await _initCache();
        Get.put(NotificationService()).init();
        if (msg != null) {
          Get.find<NotificationService>().handleMessages(
            NotificationSource.OnMessageOpenedApp,
            msg,
          );
        }
        final String authRoute =
            authLogicRes == true ? Routes.ROOT : Routes.ACCOUNT;
        return authRoute;
      }, onError: (error, stack) {
        post(
          'https://backend.majoricahotel.com/appLog/logMe.php',
          body: {
            'runtimeType': runtimeType.toString(),
            'stacktrace': stack.traces.map((trace) {
              return trace.frames.map((frame) {
                if (frame.location.contains('package:flutter') == false &&
                    frame.location.contains('dart:') == false) {
                  return {frame.location: frame.member};
                } else {
                  return '';
                }
              }).join();
            }).toList(),
            'error': error.toString(),
          },
        );
        throw error;
      });
    } catch (e) {
      AppUtil.showAlertDialog(
        title: S.current.alert,
        contentText: e.toString(),
      );
      rethrow;
    }
  }
}
