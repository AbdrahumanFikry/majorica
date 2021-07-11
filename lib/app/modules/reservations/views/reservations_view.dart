import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/reservations_controller.dart';

class ReservationsView extends GetView<ReservationsController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ReservationsView'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'ReservationsView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
