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
  static const String checkPNG = '${imagesPath}check.png';

  //Icons
  static const String appIcon = '${iconsPath}appIcon.png';

  //Lottie
  static const String emptyLottie = '${lottiePath}empty.json';
  static const String upLottie = '${lottiePath}up.json';
  static const String loadingLottie = '${lottiePath}loading.json';
  static const String pendingLottie = '${lottiePath}pending.json';
  static const String successLottie = '${lottiePath}success.json';
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
  static const String checkDate = '$url/checkDate';
  static const String reserve = '$url/reserve';
  static const String cancelReservation = '$url/cancelReservation';
  static const String myReservations = '$url/myReservations';
  static const String myDocs = '$url/myDocs';
  static const String uploadDocs = '$url/uploadDocs';
  static const String deleteDoc = '$url/deleteDoc';
  static const String updatePushToken = '$url/updatePushToken';
  static const String getHome = '$url/getHome';
  static const String sendRequest = '$url/sendRequest';
  static const String payBalance = '$url/payBalance';
}
