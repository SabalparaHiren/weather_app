import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/common/helper.dart';
import 'package:weather_app/common/widgets/loaders.dart';
import 'package:weather_app/screen/forecast/forecast_provider.dart';
import 'package:weather_app/screen/forecast/widgets/forecast_list.dart';
import 'package:weather_app/screen/forecast/widgets/forecast_top_area.dart';

class ForecastScreen extends StatelessWidget {
  const ForecastScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<ForecastProvider>(builder: (con, provider, widget) {
      if (provider.loader) {
        return const SmallLoader();
      } else {
        return SafeArea(
          child: Column(
            children: [
              const ForecastTopArea(),
              const ForecastList(),
              SizedBox(height: deviceHeight * 0.02),
            ],
          ),
        );
      }
    });
  }
}
