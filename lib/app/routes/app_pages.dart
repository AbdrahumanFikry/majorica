import 'package:get/get.dart';

import 'package:majorica/app/modules/auth/account_view.dart';
import 'package:majorica/app/modules/auth/login_view.dart';
import 'package:majorica/app/modules/auth/otp_view.dart';
import 'package:majorica/app/modules/auth/reset_password_view.dart';
import 'package:majorica/app/modules/auth/signup_view.dart';
import 'package:majorica/app/modules/available_rooms/bindings/available_rooms_binding.dart';
import 'package:majorica/app/modules/available_rooms/views/available_rooms_view.dart';
import 'package:majorica/app/modules/home/bindings/home_binding.dart';
import 'package:majorica/app/modules/home/views/home_view.dart';
import 'package:majorica/app/modules/pendings/bindings/pendings_binding.dart';
import 'package:majorica/app/modules/pendings/views/pendings_view.dart';
import 'package:majorica/app/modules/reservations/bindings/reservations_binding.dart';
import 'package:majorica/app/modules/reservations/views/reservations_view.dart';
import 'package:majorica/app/modules/room_details/bindings/room_details_binding.dart';
import 'package:majorica/app/modules/room_details/views/room_details_view.dart';
import 'package:majorica/app/modules/root/bindings/root_binding.dart';
import 'package:majorica/app/modules/root/views/root_view.dart';
import 'package:majorica/app/modules/splash/bindings/splash_binding.dart';
import 'package:majorica/app/modules/splash/views/splash_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.SPLASH;

  static final routes = [
    GetPage(
      name: _Paths.SPLASH,
      page: () => SplashView(),
      binding: SplashBinding(),
    ),
    GetPage(
      name: _Paths.HOME,
      page: () => HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.LOGIN,
      page: () => LoginView(),
      transition: Transition.fade,
    ),
    GetPage(
      name: _Paths.ACCOUNT,
      page: () => AccountView(),
      transition: Transition.fade,
    ),
    GetPage(
      name: _Paths.OTP,
      page: () => OTPView(),
      transition: Transition.fade,
    ),
    GetPage(
      name: _Paths.RESET_PASSWORD,
      page: () => ResetPasswordView(),
      transition: Transition.fade,
    ),
    GetPage(
      name: _Paths.SIGN_UP,
      page: () => SignUpView(),
      transition: Transition.fade,
    ),
    GetPage(
      name: _Paths.ROOT,
      page: () => RootView(),
      binding: RootBinding(),
      transition: Transition.fade,
    ),
    GetPage(
      name: _Paths.RESERVATIONS,
      page: () => ReservationsView(),
      binding: ReservationsBinding(),
    ),
    GetPage(
      name: _Paths.AVAILABLE_ROOMS,
      page: () => AvailableRoomsView(),
      binding: AvailableRoomsBinding(),
    ),
    GetPage(
      name: _Paths.ROOM_DETAILS,
      page: () => RoomDetailsView(),
      binding: RoomDetailsBinding(),
    ),
    GetPage(
      name: _Paths.PENDINGS,
      page: () => PendingsView(),
      binding: PendingsBinding(),
    ),
  ];
}
