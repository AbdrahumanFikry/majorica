import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  final range = Rx<DateTimeRange>(
    DateTimeRange(
      start: DateTime.now(),
      end: DateTime.now().add(
        const Duration(days: 1),
      ),
    ),
  );
}
