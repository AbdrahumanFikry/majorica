import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'app/components/app_builder.dart';
import 'app/routes/app_pages.dart';
import 'app/services/initial_binding.dart';
import 'app/utilities/app_util.dart';
import 'generated/l10n.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations(
    [
      DeviceOrientation.portraitUp,
    ],
  );
  runApp(
    MyApp(),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(1080, 1920),
      builder: () => GestureDetector(
        onTap: () => FocusScope.of(context).requestFocus(FocusNode()),
        child: AppBuilder(
          builder: (context) => GetMaterialApp(
            title: 'Majorica',
            debugShowCheckedModeBanner: false,
            defaultTransition: Transition.native,
            theme: AppUtil.appLightTheme,
            getPages: AppPages.routes,
            initialRoute: Routes.SPLASH,
            initialBinding: InitialBinding(),
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
