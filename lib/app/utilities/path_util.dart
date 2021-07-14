const imagesPath = 'assets/images/';
const iconsPath = 'assets/icons/';
const lottiePath = 'assets/lottie/';
const url = 'https://backend.majoricahotel.com';
const imagesAPI = 'https://majoricahotel.com/pub/';

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
  static const String verifyOTP = '$url/verifyOTP';
  static const String loadApp = '$url/loadApp';
  static const String resendOTP = '$url/resendOTP';
  static const String registerClient = '$url/registerClient';
  static const String authClient = '$url/authClient';
  static const String forgetPassword = '$url/forgetPassword';
  static const String changePassword = '$url/changePassword';
}
