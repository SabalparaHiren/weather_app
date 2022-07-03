import 'package:weather_app/common/helper.dart';
import 'package:weather_app/common/text_styles.dart';
import 'package:weather_app/screen/splash/bloc/splash_bloc.dart';
import 'package:weather_app/screen/splash/bloc/splash_event.dart';
import 'package:weather_app/utils/color_res.dart';
import 'package:weather_app/utils/strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    deviceHeight = MediaQuery.of(context).size.height;
    deviceWidth = MediaQuery.of(context).size.width;
    context.read<SplashBloc>().add(NavigateToDashboard());
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
