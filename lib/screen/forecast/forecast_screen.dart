import 'package:weather_app/common/helper.dart';
import 'package:weather_app/common/widgets/loaders.dart';
import 'package:weather_app/screen/forecast/bloc/forecast_bloc.dart';
import 'package:weather_app/screen/forecast/bloc/forecast_state.dart';
import 'package:weather_app/screen/forecast/widgets/forecast_list.dart';
import 'package:weather_app/screen/forecast/widgets/forecast_top_area.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ForecastScreen extends StatelessWidget {
  const ForecastScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ForecastBloc, ForecastState>(
      builder: (con, state) {
        if (state.loader == true) {
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
      },
    );
  }
}
