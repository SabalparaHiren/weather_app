import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/common/widgets/loaders.dart';
import 'package:weather_app/screen/home/home_provider.dart';
import 'package:weather_app/screen/home/widgets/bottom_list.dart';
import 'package:weather_app/screen/home/widgets/home_center_weather.dart';
import 'package:weather_app/screen/home/widgets/home_top_area.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<HomeProvider>(builder: (con, provider, widget) {
      if (provider.loader) {
        return const SmallLoader();
      } else {
        return SafeArea(
          child: Column(
            children: const [
              HomeTopArea(),
              HomeCenterWeather(),
              BottomList(),
            ],
          ),
        );
      }
    });
  }
}
