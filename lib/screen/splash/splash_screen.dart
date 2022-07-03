import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:weather_app/common/text_styles.dart';
import 'package:weather_app/screen/splash/splash_controller.dart';
import 'package:weather_app/utils/color_res.dart';
import 'package:weather_app/utils/strings.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final SplashController controller = Get.put(SplashController());
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              ColorRes.bgColor1,
              ColorRes.bgColor2,
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Center(
          child: Text(
            Strings.weather,
            style: large,
          ),
        ),
      ),
    );
  }
}
