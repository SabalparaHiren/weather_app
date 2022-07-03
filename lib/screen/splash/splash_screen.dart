import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/common/helper.dart';
import 'package:weather_app/common/text_styles.dart';
import 'package:weather_app/screen/splash/splash_provider.dart';
import 'package:weather_app/utils/color_res.dart';
import 'package:weather_app/utils/strings.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    deviceHeight = MediaQuery.of(context).size.height;
    deviceWidth = MediaQuery.of(context).size.width;
    final SplashProvider provider = Provider.of<SplashProvider>(context);
    provider.init();
    return Scaffold(
      body: Container(
        height: deviceHeight,
        width: deviceWidth,
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
