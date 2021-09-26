import 'dart:async';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:majorica/app/components/global_pending.dart';
import 'package:majorica/app/services/analytics_service.dart';
import 'app/components/app_builder.dart';
import 'app/routes/app_pages.dart';
import 'app/services/init_binding.dart';
import 'app/utilities/app_util.dart';
import 'generated/l10n.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  final fireCrash = FirebaseCrashlytics.instance;
  await fireCrash.setCrashlyticsCollectionEnabled(true);
  runZonedGuarded(() async {
    FlutterError.onError = fireCrash.recordFlutterError;
    SystemChrome.setPreferredOrientations(
      [
        DeviceOrientation.portraitUp,
      ],
    );
    FlutterError.onError = (FlutterErrorDetails details) {
      FlutterError.dumpErrorToConsole(details);
      fireCrash.recordFlutterError(details);
    };
    runApp(
      MyApp(),
    );
  }, (Object error, StackTrace stack) {
    print('OnError : ${stack.toString()}');
    fireCrash.recordError(error.toString(), stack, reason: error.toString());
  });
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Get.put<AnalyticsService>(AnalyticsService(), permanent: true);
    return ScreenUtilInit(
      designSize: const Size(1080, 1920),
      builder: () => GestureDetector(
        onTap: () => FocusScope.of(context).requestFocus(FocusNode()),
        child: AppBuilder(
          builder: (context) => GetMaterialApp(
            title: 'Majorica',
            debugShowCheckedModeBanner: false,
            defaultTransition: Transition.native,
            color: Colors.white,
            theme: AppUtil.appLightTheme,
            getPages: AppPages.routes,
            initialRoute: Routes.SPLASH,
            initialBinding: InitBinding(),
            navigatorObservers: [
              if (Get.isRegistered<AnalyticsService>())
                AnalyticsService.to.getAnalyticsObserver()
            ],
            builder: (context, child) => GlobalPending(
              child: child ?? SizedBox(height: Get.height, width: Get.width),
            ),
            localizationsDelegates: const [
              S.delegate,
              GlobalCupertinoLocalizations.delegate,
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
            ],
            supportedLocales: S.delegate.supportedLocales,
          ),
        ),
      ),
    );
  }
}
