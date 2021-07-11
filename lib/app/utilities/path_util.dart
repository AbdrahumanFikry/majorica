const imagesPath = 'assets/images/';
const iconsPath = 'assets/icons/';
const lottiePath = 'assets/lottie/';
const url = 'https://backend.majoricahotel.com';

class PathUtil {
  //Images
  static const String authPNG = '${imagesPath}auth.png';
  static const String otpPNG = '${imagesPath}otp.png';
  static const String forgotPasswordPNG = '${imagesPath}forgot_password.png';

  //Icons
  static const String appIcon = '${iconsPath}appIcon.png';

  //Lottie
  static const String emptyLottie = '${lottiePath}empty.json';
  static const String upLottie = '${lottiePath}up.json';
}

class ApiUtil {
  static const String checkMobile = '$url/checkMobile';
}
