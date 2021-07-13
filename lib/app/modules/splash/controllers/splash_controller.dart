import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:majorica/app/routes/app_pages.dart';
import 'package:majorica/app/services/auth_service.dart';
import 'package:majorica/app/services/cache_service.dart';
import 'package:majorica/app/utilities/app_util.dart';
import 'package:majorica/generated/l10n.dart';
import 'package:hive_flutter/hive_flutter.dart';

class SplashController extends GetxController {
  Future<void> _initCache() async {
    await Hive.initFlutter('v1');
    await (Get.put(CacheService())).init();
  }

  Future<String> initFunction(BuildContext context) async {
    try {
      //TODO init fireBase here
      await _initCache();
      Get.put<AuthService>(AuthService());
      final authLogicRes = await CacheService.to.userRepo.initAuthLogic();
      // if (authLogicRes) await AuthService.to.loadApp();
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
