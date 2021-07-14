import 'package:flutter/material.dart';
import 'package:intl/intl.dart' as intl;
import 'package:majorica/app/utilities/app_util.dart';

extension DateTimeExt on DateTime {
  String toShortUserString() {
    if (this == null) {
      return '-';
    } else {
      return intl.DateFormat(
        'yyyy-MM-dd',
        const Locale('en', 'US').toString(),
      ).format(this);
    }
  }

  String toLongUserString() {
    if (this == null) {
      return '-';
    } else {
      return intl.DateFormat.yMMMMEEEEd(AppUtil.currentLocale.toString())
          .format(this);
    }
  }

  String toDayMonthOnly() {
    if (this == null) {
      return '-';
    } else {
      return intl.DateFormat.MMMd(AppUtil.currentLocale.toString())
          .format(this);
    }
  }
}
