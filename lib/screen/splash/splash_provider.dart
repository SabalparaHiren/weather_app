import 'package:flutter/material.dart';
import 'package:weather_app/common/helper.dart';
import 'package:weather_app/screen/dashboard/dahsboard.dart';

class SplashProvider extends ChangeNotifier {
  void init() {
    Future.delayed(const Duration(milliseconds: 2000), () {
      navigateToHomeScreen();
    });
  }

  void navigateToHomeScreen() {
    navigator.currentState!.pushReplacement(
      MaterialPageRoute(builder: (context) => const Dashboard()),
    );
  }
}
