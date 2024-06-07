import 'package:devfaru_eccomerce/modules/splash/splash_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SplashView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final SplashController controller = Get.find();

    return Scaffold(
      body: Center(
        child: Text(
          'DevFaru E-Commerce App',
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
