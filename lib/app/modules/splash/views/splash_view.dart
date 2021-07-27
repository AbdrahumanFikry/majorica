import 'package:bdaya_custom_splash/bdaya_custom_splash.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:majorica/app/services/cache_service.dart';
import 'package:majorica/app/utilities/app_util.dart';
import 'package:majorica/app/utilities/color_util.dart';
import 'package:majorica/app/utilities/path_util.dart';
import 'package:majorica/generated/l10n.dart';

import '../controllers/splash_controller.dart';

class SplashView extends GetView<SplashController> {
  @override
  Widget build(BuildContext context) {
    return BdayaCustomSplash(
      splashDuration: 2,
      backgroundBuilder: (child) {
        return Container(
          color: ColorUtil.whiteScaffold,
          child: child,
        );
      },
      initFunction: () async => controller.initFunction(context),
      logoBuilder: () {
        return Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                PathUtil.appIcon,
                height: 600.sp,
              ),
              const SizedBox(
                height: 10.0,
              ),
              Text(
                'MAJORICA\nMARINA\nHOTEL',
                style: AppUtil.textStyle(
                  fontFamily: 'PlayfairDisplay',
                  fontSize: 70.sp,
                  letterSpacing: 2.5,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        );
      },
      onNavigateTo: (result) async {
        String? currentLang = CacheService.to.settingsRepo.cachedLang;
        print(currentLang);
        if (currentLang == 'null' || currentLang.isEmpty) {
          await S.load(const Locale('ar'));
          currentLang = await AppUtil.languageSelection();
          await CacheService.to.settingsRepo.setCachedLang(currentLang ?? 'ar');
        } else {
          await S.load(Locale(currentLang));
        }
        Get.offAllNamed(result.toString());
      },
    );
  }
}
