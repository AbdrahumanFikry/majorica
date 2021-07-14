// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values

class S {
  S();

  static S? _current;

  static S get current {
    assert(_current != null, 'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.');
    return _current!;
  }

  static const AppLocalizationDelegate delegate =
    AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false) ? locale.languageCode : locale.toString();
    final localeName = Intl.canonicalizedLocale(name); 
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;
 
      return instance;
    });
  } 

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(instance != null, 'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?');
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `تاكيد`
  String get confirm {
    return Intl.message(
      'تاكيد',
      name: 'confirm',
      desc: '',
      args: [],
    );
  }

  /// `هل انت متأكد`
  String get areYouSure {
    return Intl.message(
      'هل انت متأكد',
      name: 'areYouSure',
      desc: '',
      args: [],
    );
  }

  /// `الرقم القومى`
  String get nationalId {
    return Intl.message(
      'الرقم القومى',
      name: 'nationalId',
      desc: '',
      args: [],
    );
  }

  /// `برجاء إدخال {length} حروف على الأقل`
  String hasMinLength(Object length) {
    return Intl.message(
      'برجاء إدخال $length حروف على الأقل',
      name: 'hasMinLength',
      desc: '',
      args: [length],
    );
  }

  /// `من فضلك أدخل كلمة المرور الجديده لإعادة ضبتها`
  String get resetPasswordDesc {
    return Intl.message(
      'من فضلك أدخل كلمة المرور الجديده لإعادة ضبتها',
      name: 'resetPasswordDesc',
      desc: '',
      args: [],
    );
  }

  /// `كلمتي المرور غير متطابقتان !`
  String get passwordsDoNotMatch {
    return Intl.message(
      'كلمتي المرور غير متطابقتان !',
      name: 'passwordsDoNotMatch',
      desc: '',
      args: [],
    );
  }

  /// `كود التفعيل مكون من 4 أرقام !`
  String get fourDigitsIsAMust {
    return Intl.message(
      'كود التفعيل مكون من 4 أرقام !',
      name: 'fourDigitsIsAMust',
      desc: '',
      args: [],
    );
  }

  /// `من فضلك أدخل رقم هاتفك لإرسال كود التفعيل`
  String get phoneNeededDesc {
    return Intl.message(
      'من فضلك أدخل رقم هاتفك لإرسال كود التفعيل',
      name: 'phoneNeededDesc',
      desc: '',
      args: [],
    );
  }

  /// `تم إرسال كود من 4 أرقام إلى رقم هاتفك قم بإدراجه للإستمرار`
  String get verifyText {
    return Intl.message(
      'تم إرسال كود من 4 أرقام إلى رقم هاتفك قم بإدراجه للإستمرار',
      name: 'verifyText',
      desc: '',
      args: [],
    );
  }

  /// `نسيت كلمه المرور؟`
  String get forgetPassword {
    return Intl.message(
      'نسيت كلمه المرور؟',
      name: 'forgetPassword',
      desc: '',
      args: [],
    );
  }

  /// `من فضلك ادخل بريدك الإلكترونى`
  String get emailNull {
    return Intl.message(
      'من فضلك ادخل بريدك الإلكترونى',
      name: 'emailNull',
      desc: '',
      args: [],
    );
  }

  /// `من فضلك أدخل رقم قومى صحيح`
  String get invalidNationalId {
    return Intl.message(
      'من فضلك أدخل رقم قومى صحيح',
      name: 'invalidNationalId',
      desc: '',
      args: [],
    );
  }

  /// `من فضلك ادخل كلمة مرور صحيحه`
  String get invalidPassword {
    return Intl.message(
      'من فضلك ادخل كلمة مرور صحيحه',
      name: 'invalidPassword',
      desc: '',
      args: [],
    );
  }

  /// `من فضلك التأكد من كلمة المرور`
  String get invalidConfirmPassword {
    return Intl.message(
      'من فضلك التأكد من كلمة المرور',
      name: 'invalidConfirmPassword',
      desc: '',
      args: [],
    );
  }

  /// `من فضلك ادخل كلمة المرور`
  String get passwordNull {
    return Intl.message(
      'من فضلك ادخل كلمة المرور',
      name: 'passwordNull',
      desc: '',
      args: [],
    );
  }

  /// `كلمة المرور قصيره`
  String get shortPassword {
    return Intl.message(
      'كلمة المرور قصيره',
      name: 'shortPassword',
      desc: '',
      args: [],
    );
  }

  /// `من فضلك ادخل الاسم`
  String get nameNull {
    return Intl.message(
      'من فضلك ادخل الاسم',
      name: 'nameNull',
      desc: '',
      args: [],
    );
  }

  /// `من فضلك ادخل رقم الهاتف`
  String get phoneNumberNull {
    return Intl.message(
      'من فضلك ادخل رقم الهاتف',
      name: 'phoneNumberNull',
      desc: '',
      args: [],
    );
  }

  /// `من فضلك أدخل رقم هاتف صالح`
  String get invalidPhoneNumber {
    return Intl.message(
      'من فضلك أدخل رقم هاتف صالح',
      name: 'invalidPhoneNumber',
      desc: '',
      args: [],
    );
  }

  /// `من فضلك أدخل بريد إلكترونى صالح`
  String get invalidEmail {
    return Intl.message(
      'من فضلك أدخل بريد إلكترونى صالح',
      name: 'invalidEmail',
      desc: '',
      args: [],
    );
  }

  /// `رقم الهاتف قصير`
  String get shortPhone {
    return Intl.message(
      'رقم الهاتف قصير',
      name: 'shortPhone',
      desc: '',
      args: [],
    );
  }

  /// `هذا الحقل مطلوب!`
  String get inputNull {
    return Intl.message(
      'هذا الحقل مطلوب!',
      name: 'inputNull',
      desc: '',
      args: [],
    );
  }

  /// `حدث خطأ اثناء التسجيل`
  String get signInFailed {
    return Intl.message(
      'حدث خطأ اثناء التسجيل',
      name: 'signInFailed',
      desc: '',
      args: [],
    );
  }

  /// `تأكد من الرقم القومى وكلمه المرور`
  String get idOrPasswordIsWrong {
    return Intl.message(
      'تأكد من الرقم القومى وكلمه المرور',
      name: 'idOrPasswordIsWrong',
      desc: '',
      args: [],
    );
  }

  /// `فشل الاتصال حاول مره اخرى`
  String get noNetwork {
    return Intl.message(
      'فشل الاتصال حاول مره اخرى',
      name: 'noNetwork',
      desc: '',
      args: [],
    );
  }

  /// `البيانات ليست مكتمله!`
  String get dataIsNotCompleted {
    return Intl.message(
      'البيانات ليست مكتمله!',
      name: 'dataIsNotCompleted',
      desc: '',
      args: [],
    );
  }

  /// `اختر لغتك`
  String get selectLanguageTitle {
    return Intl.message(
      'اختر لغتك',
      name: 'selectLanguageTitle',
      desc: '',
      args: [],
    );
  }

  /// `لديك حساب بالفعل؟`
  String get alreadyHaveAcc {
    return Intl.message(
      'لديك حساب بالفعل؟',
      name: 'alreadyHaveAcc',
      desc: '',
      args: [],
    );
  }

  /// `ليس لديك حساب؟`
  String get donNotHaveAcc {
    return Intl.message(
      'ليس لديك حساب؟',
      name: 'donNotHaveAcc',
      desc: '',
      args: [],
    );
  }

  /// `اللغه`
  String get language {
    return Intl.message(
      'اللغه',
      name: 'language',
      desc: '',
      args: [],
    );
  }

  /// `مسح الذاكره`
  String get clearCache {
    return Intl.message(
      'مسح الذاكره',
      name: 'clearCache',
      desc: '',
      args: [],
    );
  }

  /// `إكتشف`
  String get explore {
    return Intl.message(
      'إكتشف',
      name: 'explore',
      desc: '',
      args: [],
    );
  }

  /// `تسجيل الدخول`
  String get signIn {
    return Intl.message(
      'تسجيل الدخول',
      name: 'signIn',
      desc: '',
      args: [],
    );
  }

  /// `تسجيل جديد`
  String get signUp {
    return Intl.message(
      'تسجيل جديد',
      name: 'signUp',
      desc: '',
      args: [],
    );
  }

  /// `التالي`
  String get next {
    return Intl.message(
      'التالي',
      name: 'next',
      desc: '',
      args: [],
    );
  }

  /// `تخطى`
  String get skip {
    return Intl.message(
      'تخطى',
      name: 'skip',
      desc: '',
      args: [],
    );
  }

  /// `إستمرار`
  String get continueNext {
    return Intl.message(
      'إستمرار',
      name: 'continueNext',
      desc: '',
      args: [],
    );
  }

  /// `رجوع`
  String get back {
    return Intl.message(
      'رجوع',
      name: 'back',
      desc: '',
      args: [],
    );
  }

  /// `الدخول كضيف`
  String get guest {
    return Intl.message(
      'الدخول كضيف',
      name: 'guest',
      desc: '',
      args: [],
    );
  }

  /// `تم`
  String get done {
    return Intl.message(
      'تم',
      name: 'done',
      desc: '',
      args: [],
    );
  }

  /// `الوظيفة`
  String get jobDesc {
    return Intl.message(
      'الوظيفة',
      name: 'jobDesc',
      desc: '',
      args: [],
    );
  }

  /// `كلمة المرور`
  String get password {
    return Intl.message(
      'كلمة المرور',
      name: 'password',
      desc: '',
      args: [],
    );
  }

  /// `تأكيد كلمة المرور`
  String get confirmPassword {
    return Intl.message(
      'تأكيد كلمة المرور',
      name: 'confirmPassword',
      desc: '',
      args: [],
    );
  }

  /// `كلمه المرور القديمه`
  String get oldPassword {
    return Intl.message(
      'كلمه المرور القديمه',
      name: 'oldPassword',
      desc: '',
      args: [],
    );
  }

  /// `تاريخ الميلاد`
  String get birthDate {
    return Intl.message(
      'تاريخ الميلاد',
      name: 'birthDate',
      desc: '',
      args: [],
    );
  }

  /// `تنبيه`
  String get alert {
    return Intl.message(
      'تنبيه',
      name: 'alert',
      desc: '',
      args: [],
    );
  }

  /// `بطاقة الخصم`
  String get discountCard {
    return Intl.message(
      'بطاقة الخصم',
      name: 'discountCard',
      desc: '',
      args: [],
    );
  }

  /// `الملف الشخصى`
  String get profile {
    return Intl.message(
      'الملف الشخصى',
      name: 'profile',
      desc: '',
      args: [],
    );
  }

  /// `المفضلات`
  String get favourite {
    return Intl.message(
      'المفضلات',
      name: 'favourite',
      desc: '',
      args: [],
    );
  }

  /// `الإعدادات`
  String get settings {
    return Intl.message(
      'الإعدادات',
      name: 'settings',
      desc: '',
      args: [],
    );
  }

  /// `معلومات عنا`
  String get aboutUs {
    return Intl.message(
      'معلومات عنا',
      name: 'aboutUs',
      desc: '',
      args: [],
    );
  }

  /// `تسجيل الخروج`
  String get signOut {
    return Intl.message(
      'تسجيل الخروج',
      name: 'signOut',
      desc: '',
      args: [],
    );
  }

  /// `الإشعارات`
  String get notifications {
    return Intl.message(
      'الإشعارات',
      name: 'notifications',
      desc: '',
      args: [],
    );
  }

  /// `لا توجد بيانات`
  String get thisEmpty {
    return Intl.message(
      'لا توجد بيانات',
      name: 'thisEmpty',
      desc: '',
      args: [],
    );
  }

  /// `لم نعثر على اى بيانات`
  String get didNotFind {
    return Intl.message(
      'لم نعثر على اى بيانات',
      name: 'didNotFind',
      desc: '',
      args: [],
    );
  }

  /// `بيانات`
  String get data {
    return Intl.message(
      'بيانات',
      name: 'data',
      desc: '',
      args: [],
    );
  }

  /// `بحث`
  String get search {
    return Intl.message(
      'بحث',
      name: 'search',
      desc: '',
      args: [],
    );
  }

  /// `انطلق`
  String get go {
    return Intl.message(
      'انطلق',
      name: 'go',
      desc: '',
      args: [],
    );
  }

  /// `الرئيسيه`
  String get home {
    return Intl.message(
      'الرئيسيه',
      name: 'home',
      desc: '',
      args: [],
    );
  }

  /// `المزيد`
  String get more {
    return Intl.message(
      'المزيد',
      name: 'more',
      desc: '',
      args: [],
    );
  }

  /// `تحديد البيانات المعروضه`
  String get filter {
    return Intl.message(
      'تحديد البيانات المعروضه',
      name: 'filter',
      desc: '',
      args: [],
    );
  }

  /// `إرسال`
  String get send {
    return Intl.message(
      'إرسال',
      name: 'send',
      desc: '',
      args: [],
    );
  }

  /// `عنوان البريد الإلكترونى`
  String get email {
    return Intl.message(
      'عنوان البريد الإلكترونى',
      name: 'email',
      desc: '',
      args: [],
    );
  }

  /// `العنوان`
  String get address {
    return Intl.message(
      'العنوان',
      name: 'address',
      desc: '',
      args: [],
    );
  }

  /// `المحافظه`
  String get governorate {
    return Intl.message(
      'المحافظه',
      name: 'governorate',
      desc: '',
      args: [],
    );
  }

  /// `مزيد من التفاصيل`
  String get moreDetails {
    return Intl.message(
      'مزيد من التفاصيل',
      name: 'moreDetails',
      desc: '',
      args: [],
    );
  }

  /// `أضف ملف`
  String get attachFile {
    return Intl.message(
      'أضف ملف',
      name: 'attachFile',
      desc: '',
      args: [],
    );
  }

  /// `{count} ملفات تم رفعها `
  String filesUploaded(Object count) {
    return Intl.message(
      '$count ملفات تم رفعها ',
      name: 'filesUploaded',
      desc: '',
      args: [count],
    );
  }

  /// `الإسم`
  String get name {
    return Intl.message(
      'الإسم',
      name: 'name',
      desc: '',
      args: [],
    );
  }

  /// `الشركه`
  String get company {
    return Intl.message(
      'الشركه',
      name: 'company',
      desc: '',
      args: [],
    );
  }

  /// `الجنس`
  String get gender {
    return Intl.message(
      'الجنس',
      name: 'gender',
      desc: '',
      args: [],
    );
  }

  /// `تاريخ البدء`
  String get startDate {
    return Intl.message(
      'تاريخ البدء',
      name: 'startDate',
      desc: '',
      args: [],
    );
  }

  /// `تاريخ الإنتهاء`
  String get endDate {
    return Intl.message(
      'تاريخ الإنتهاء',
      name: 'endDate',
      desc: '',
      args: [],
    );
  }

  /// `رقم الهاتف المحمول`
  String get phoneNumber {
    return Intl.message(
      'رقم الهاتف المحمول',
      name: 'phoneNumber',
      desc: '',
      args: [],
    );
  }

  /// `تعديل الملف الشخصى`
  String get editProfile {
    return Intl.message(
      'تعديل الملف الشخصى',
      name: 'editProfile',
      desc: '',
      args: [],
    );
  }

  /// `تعديل`
  String get edit {
    return Intl.message(
      'تعديل',
      name: 'edit',
      desc: '',
      args: [],
    );
  }

  /// `الموقع`
  String get location {
    return Intl.message(
      'الموقع',
      name: 'location',
      desc: '',
      args: [],
    );
  }

  /// `الفئه`
  String get category {
    return Intl.message(
      'الفئه',
      name: 'category',
      desc: '',
      args: [],
    );
  }

  /// `التخصص`
  String get specialization {
    return Intl.message(
      'التخصص',
      name: 'specialization',
      desc: '',
      args: [],
    );
  }

  /// `الهاتف`
  String get telPhone {
    return Intl.message(
      'الهاتف',
      name: 'telPhone',
      desc: '',
      args: [],
    );
  }

  /// `المفضله`
  String get favorite {
    return Intl.message(
      'المفضله',
      name: 'favorite',
      desc: '',
      args: [],
    );
  }

  /// `الدردشه`
  String get chat {
    return Intl.message(
      'الدردشه',
      name: 'chat',
      desc: '',
      args: [],
    );
  }

  /// `الرسائل`
  String get messages {
    return Intl.message(
      'الرسائل',
      name: 'messages',
      desc: '',
      args: [],
    );
  }

  /// `أكتب رساله`
  String get typeMessage {
    return Intl.message(
      'أكتب رساله',
      name: 'typeMessage',
      desc: '',
      args: [],
    );
  }

  /// `لا يوجد رسائل الى الان`
  String get noMessagesYet {
    return Intl.message(
      'لا يوجد رسائل الى الان',
      name: 'noMessagesYet',
      desc: '',
      args: [],
    );
  }

  /// `إلغاء`
  String get cancel {
    return Intl.message(
      'إلغاء',
      name: 'cancel',
      desc: '',
      args: [],
    );
  }

  /// `تحقق من اتصالك بالانترنت`
  String get socketException {
    return Intl.message(
      'تحقق من اتصالك بالانترنت',
      name: 'socketException',
      desc: '',
      args: [],
    );
  }

  /// `تعذر الاتصال بالخادم`
  String get httpException {
    return Intl.message(
      'تعذر الاتصال بالخادم',
      name: 'httpException',
      desc: '',
      args: [],
    );
  }

  /// `حدث خطأ غير متوقع`
  String get formatException {
    return Intl.message(
      'حدث خطأ غير متوقع',
      name: 'formatException',
      desc: '',
      args: [],
    );
  }

  /// `إعادة المحاوله`
  String get retry {
    return Intl.message(
      'إعادة المحاوله',
      name: 'retry',
      desc: '',
      args: [],
    );
  }

  /// `لم تقم بتغيير أى بيانات`
  String get noChangedData {
    return Intl.message(
      'لم تقم بتغيير أى بيانات',
      name: 'noChangedData',
      desc: '',
      args: [],
    );
  }

  /// `غير مصرح لك !`
  String get unAuthorized {
    return Intl.message(
      'غير مصرح لك !',
      name: 'unAuthorized',
      desc: '',
      args: [],
    );
  }

  /// `لا يوجد بيانات !`
  String get noData {
    return Intl.message(
      'لا يوجد بيانات !',
      name: 'noData',
      desc: '',
      args: [],
    );
  }

  /// `أخر العمليات`
  String get lastOperations {
    return Intl.message(
      'أخر العمليات',
      name: 'lastOperations',
      desc: '',
      args: [],
    );
  }

  /// `جنيه`
  String get egp {
    return Intl.message(
      'جنيه',
      name: 'egp',
      desc: '',
      args: [],
    );
  }

  /// `رقم الحساب`
  String get accountId {
    return Intl.message(
      'رقم الحساب',
      name: 'accountId',
      desc: '',
      args: [],
    );
  }

  /// `دخول`
  String get enter {
    return Intl.message(
      'دخول',
      name: 'enter',
      desc: '',
      args: [],
    );
  }

  /// `تم ارسال كود التأكيد علي هاتفك`
  String get otpSendDone {
    return Intl.message(
      'تم ارسال كود التأكيد علي هاتفك',
      name: 'otpSendDone',
      desc: '',
      args: [],
    );
  }

  /// `أدخل الكود`
  String get enterCode {
    return Intl.message(
      'أدخل الكود',
      name: 'enterCode',
      desc: '',
      args: [],
    );
  }

  /// `إرسال مره أخرى`
  String get sendAgain {
    return Intl.message(
      'إرسال مره أخرى',
      name: 'sendAgain',
      desc: '',
      args: [],
    );
  }

  /// `التأكيد و الدخول`
  String get confirmAndEnter {
    return Intl.message(
      'التأكيد و الدخول',
      name: 'confirmAndEnter',
      desc: '',
      args: [],
    );
  }

  /// `أدخل رقم الهاتف الخاص بك`
  String get enterOwnPhone {
    return Intl.message(
      'أدخل رقم الهاتف الخاص بك',
      name: 'enterOwnPhone',
      desc: '',
      args: [],
    );
  }

  /// `عند كتابة رقم هاتفك سيتم ارسال رسالة قصيره بكود تأكيد علي هاتفك, كن علي استعداد`
  String get phoneHint {
    return Intl.message(
      'عند كتابة رقم هاتفك سيتم ارسال رسالة قصيره بكود تأكيد علي هاتفك, كن علي استعداد',
      name: 'phoneHint',
      desc: '',
      args: [],
    );
  }

  /// `إنشاء حساب مستخدم`
  String get createUserAccount {
    return Intl.message(
      'إنشاء حساب مستخدم',
      name: 'createUserAccount',
      desc: '',
      args: [],
    );
  }

  /// `الإسم التجاري`
  String get tradeName {
    return Intl.message(
      'الإسم التجاري',
      name: 'tradeName',
      desc: '',
      args: [],
    );
  }

  /// `إنشاء الاَن`
  String get createNow {
    return Intl.message(
      'إنشاء الاَن',
      name: 'createNow',
      desc: '',
      args: [],
    );
  }

  /// `اضغط على الأيقونة أدناه لإختيار التاريخ`
  String get birthDateHint {
    return Intl.message(
      'اضغط على الأيقونة أدناه لإختيار التاريخ',
      name: 'birthDateHint',
      desc: '',
      args: [],
    );
  }

  /// `اختر تاريخ ميلادك بشكل صحيح`
  String get chooseBirthDate {
    return Intl.message(
      'اختر تاريخ ميلادك بشكل صحيح',
      name: 'chooseBirthDate',
      desc: '',
      args: [],
    );
  }

  /// `ذكر`
  String get male {
    return Intl.message(
      'ذكر',
      name: 'male',
      desc: '',
      args: [],
    );
  }

  /// `انثى`
  String get female {
    return Intl.message(
      'انثى',
      name: 'female',
      desc: '',
      args: [],
    );
  }

  /// `البيانات الاحترافية`
  String get professionalData {
    return Intl.message(
      'البيانات الاحترافية',
      name: 'professionalData',
      desc: '',
      args: [],
    );
  }

  /// `صورة البطاقه الشخصيه`
  String get idPhoto {
    return Intl.message(
      'صورة البطاقه الشخصيه',
      name: 'idPhoto',
      desc: '',
      args: [],
    );
  }

  /// `الأمام`
  String get front {
    return Intl.message(
      'الأمام',
      name: 'front',
      desc: '',
      args: [],
    );
  }

  /// `الخلف`
  String get rear {
    return Intl.message(
      'الخلف',
      name: 'rear',
      desc: '',
      args: [],
    );
  }

  /// `السجل التجارى`
  String get commercialRegister {
    return Intl.message(
      'السجل التجارى',
      name: 'commercialRegister',
      desc: '',
      args: [],
    );
  }

  /// `البطاقه الضريبيه`
  String get taxCard {
    return Intl.message(
      'البطاقه الضريبيه',
      name: 'taxCard',
      desc: '',
      args: [],
    );
  }

  /// `كلتا صورتي الهوية مطلوبة (أمامية وخلفية)`
  String get idValidation {
    return Intl.message(
      'كلتا صورتي الهوية مطلوبة (أمامية وخلفية)',
      name: 'idValidation',
      desc: '',
      args: [],
    );
  }

  /// `أوافق علي الشروط والاحكام`
  String get agreeToTermsAndConditions {
    return Intl.message(
      'أوافق علي الشروط والاحكام',
      name: 'agreeToTermsAndConditions',
      desc: '',
      args: [],
    );
  }

  /// `يجب أن توافق على الشروط والأحكام الخاصة بنا لمواصله التسجيل`
  String get termsAndConditionsValidation {
    return Intl.message(
      'يجب أن توافق على الشروط والأحكام الخاصة بنا لمواصله التسجيل',
      name: 'termsAndConditionsValidation',
      desc: '',
      args: [],
    );
  }

  /// ` {lang} ستكون لغتك الإفتراضيه `
  String defaultLang(Object lang) {
    return Intl.message(
      ' $lang ستكون لغتك الإفتراضيه ',
      name: 'defaultLang',
      desc: '',
      args: [lang],
    );
  }

  /// `حسابى`
  String get account {
    return Intl.message(
      'حسابى',
      name: 'account',
      desc: '',
      args: [],
    );
  }

  /// `حجوزاتى`
  String get reservations {
    return Intl.message(
      'حجوزاتى',
      name: 'reservations',
      desc: '',
      args: [],
    );
  }

  /// `أحجز غرفه`
  String get reserveRoom {
    return Intl.message(
      'أحجز غرفه',
      name: 'reserveRoom',
      desc: '',
      args: [],
    );
  }

  /// `تاريخ الحجز`
  String get reservationDate {
    return Intl.message(
      'تاريخ الحجز',
      name: 'reservationDate',
      desc: '',
      args: [],
    );
  }

  /// `اضغط لاختيار المده`
  String get pressToChooseDate {
    return Intl.message(
      'اضغط لاختيار المده',
      name: 'pressToChooseDate',
      desc: '',
      args: [],
    );
  }

  /// `تاريخ الإنتهاء يجب أن يكون بعد تاريخ البدء وليس العكس`
  String get endDateValidation {
    return Intl.message(
      'تاريخ الإنتهاء يجب أن يكون بعد تاريخ البدء وليس العكس',
      name: 'endDateValidation',
      desc: '',
      args: [],
    );
  }

  /// `يجب إختيار تاريخ البدء أولاً`
  String get startDateNull {
    return Intl.message(
      'يجب إختيار تاريخ البدء أولاً',
      name: 'startDateNull',
      desc: '',
      args: [],
    );
  }

  /// `أختر فتره الاقامه`
  String get choosePeriod {
    return Intl.message(
      'أختر فتره الاقامه',
      name: 'choosePeriod',
      desc: '',
      args: [],
    );
  }

  /// `الغرف المتاحه`
  String get availableRooms {
    return Intl.message(
      'الغرف المتاحه',
      name: 'availableRooms',
      desc: '',
      args: [],
    );
  }

  /// `متاح`
  String get available {
    return Intl.message(
      'متاح',
      name: 'available',
      desc: '',
      args: [],
    );
  }

  /// `الوصف`
  String get description {
    return Intl.message(
      'الوصف',
      name: 'description',
      desc: '',
      args: [],
    );
  }

  /// `الحزم`
  String get packages {
    return Intl.message(
      'الحزم',
      name: 'packages',
      desc: '',
      args: [],
    );
  }

  /// `جنيه/ليله`
  String get egpPerNight {
    return Intl.message(
      'جنيه/ليله',
      name: 'egpPerNight',
      desc: '',
      args: [],
    );
  }

  /// `الأفراد`
  String get participants {
    return Intl.message(
      'الأفراد',
      name: 'participants',
      desc: '',
      args: [],
    );
  }

  /// `أقصى عدد للأفراد`
  String get maxParticipantsNum {
    return Intl.message(
      'أقصى عدد للأفراد',
      name: 'maxParticipantsNum',
      desc: '',
      args: [],
    );
  }

  /// `أقصى عدد غرف متاح`
  String get maxAvailableRooms {
    return Intl.message(
      'أقصى عدد غرف متاح',
      name: 'maxAvailableRooms',
      desc: '',
      args: [],
    );
  }

  /// `الغرف`
  String get rooms {
    return Intl.message(
      'الغرف',
      name: 'rooms',
      desc: '',
      args: [],
    );
  }

  /// `أحجز الان`
  String get reserveNow {
    return Intl.message(
      'أحجز الان',
      name: 'reserveNow',
      desc: '',
      args: [],
    );
  }

  /// `تم إضافه حجزك الى المعلقه`
  String get pendingDoneDesc {
    return Intl.message(
      'تم إضافه حجزك الى المعلقه',
      name: 'pendingDoneDesc',
      desc: '',
      args: [],
    );
  }

  /// `أذهب الى المعلقه`
  String get goToPending {
    return Intl.message(
      'أذهب الى المعلقه',
      name: 'goToPending',
      desc: '',
      args: [],
    );
  }

  /// `جميع الحجوزات`
  String get allReservations {
    return Intl.message(
      'جميع الحجوزات',
      name: 'allReservations',
      desc: '',
      args: [],
    );
  }

  /// `فائته`
  String get past {
    return Intl.message(
      'فائته',
      name: 'past',
      desc: '',
      args: [],
    );
  }

  /// `قادمه`
  String get upComing {
    return Intl.message(
      'قادمه',
      name: 'upComing',
      desc: '',
      args: [],
    );
  }

  /// `الأجمالى`
  String get total {
    return Intl.message(
      'الأجمالى',
      name: 'total',
      desc: '',
      args: [],
    );
  }

  /// `عرض`
  String get offer {
    return Intl.message(
      'عرض',
      name: 'offer',
      desc: '',
      args: [],
    );
  }

  /// `نقاط`
  String get points {
    return Intl.message(
      'نقاط',
      name: 'points',
      desc: '',
      args: [],
    );
  }

  /// `تغيير كلمه المرور`
  String get changePassword {
    return Intl.message(
      'تغيير كلمه المرور',
      name: 'changePassword',
      desc: '',
      args: [],
    );
  }

  /// `دعوه أصدقاء`
  String get inviteFriends {
    return Intl.message(
      'دعوه أصدقاء',
      name: 'inviteFriends',
      desc: '',
      args: [],
    );
  }

  /// `تواصل معانا`
  String get contactUs {
    return Intl.message(
      'تواصل معانا',
      name: 'contactUs',
      desc: '',
      args: [],
    );
  }

  /// `قيمنا فى المتجر`
  String get rateUsOnStore {
    return Intl.message(
      'قيمنا فى المتجر',
      name: 'rateUsOnStore',
      desc: '',
      args: [],
    );
  }

  /// `شروط الخدمه`
  String get termsOfService {
    return Intl.message(
      'شروط الخدمه',
      name: 'termsOfService',
      desc: '',
      args: [],
    );
  }

  /// `فى انتظار التأكيد`
  String get pending {
    return Intl.message(
      'فى انتظار التأكيد',
      name: 'pending',
      desc: '',
      args: [],
    );
  }

  /// `كوبون الخصم`
  String get discountCoupon {
    return Intl.message(
      'كوبون الخصم',
      name: 'discountCoupon',
      desc: '',
      args: [],
    );
  }

  /// `أدخل كوبون الخصم`
  String get enterDiscountCoupon {
    return Intl.message(
      'أدخل كوبون الخصم',
      name: 'enterDiscountCoupon',
      desc: '',
      args: [],
    );
  }

  /// `تأكيد الحجز`
  String get confirmReservation {
    return Intl.message(
      'تأكيد الحجز',
      name: 'confirmReservation',
      desc: '',
      args: [],
    );
  }

  /// `خصم`
  String get discount {
    return Intl.message(
      'خصم',
      name: 'discount',
      desc: '',
      args: [],
    );
  }

  /// `الدفع`
  String get payment {
    return Intl.message(
      'الدفع',
      name: 'payment',
      desc: '',
      args: [],
    );
  }

  /// `تفاصيل الدفع`
  String get reservationDetails {
    return Intl.message(
      'تفاصيل الدفع',
      name: 'reservationDetails',
      desc: '',
      args: [],
    );
  }

  /// `إالغاء الحجز`
  String get cancelReservation {
    return Intl.message(
      'إالغاء الحجز',
      name: 'cancelReservation',
      desc: '',
      args: [],
    );
  }

  /// `تفاصيل الدفع`
  String get paymentDetails {
    return Intl.message(
      'تفاصيل الدفع',
      name: 'paymentDetails',
      desc: '',
      args: [],
    );
  }

  /// ` رقم العمليه`
  String get id {
    return Intl.message(
      ' رقم العمليه',
      name: 'id',
      desc: '',
      args: [],
    );
  }

  /// `المبلغ`
  String get amount {
    return Intl.message(
      'المبلغ',
      name: 'amount',
      desc: '',
      args: [],
    );
  }

  /// `رقم المراجعه`
  String get refID {
    return Intl.message(
      'رقم المراجعه',
      name: 'refID',
      desc: '',
      args: [],
    );
  }

  /// `مدفوع ل`
  String get paidFor {
    return Intl.message(
      'مدفوع ل',
      name: 'paidFor',
      desc: '',
      args: [],
    );
  }

  /// `حذف الالكوبون`
  String get removeCoupon {
    return Intl.message(
      'حذف الالكوبون',
      name: 'removeCoupon',
      desc: '',
      args: [],
    );
  }

  /// `الاجمالى قبل الكوبون`
  String get totalBeforeCoupon {
    return Intl.message(
      'الاجمالى قبل الكوبون',
      name: 'totalBeforeCoupon',
      desc: '',
      args: [],
    );
  }

  /// `تم الدفع بنجاح`
  String get paymentDoneSuccessfully {
    return Intl.message(
      'تم الدفع بنجاح',
      name: 'paymentDoneSuccessfully',
      desc: '',
      args: [],
    );
  }

  /// `لم تكتمل عمليه الدفع حدث خطأ ما`
  String get paymentError {
    return Intl.message(
      'لم تكتمل عمليه الدفع حدث خطأ ما',
      name: 'paymentError',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'ar'),
      Locale.fromSubtags(languageCode: 'en'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}