import 'package:weather_app/common/widgets/loaders.dart';
import 'package:weather_app/screen/home/bloc/home_bloc.dart';
import 'package:weather_app/screen/home/bloc/home_state.dart';
import 'package:weather_app/screen/home/widgets/bottom_list.dart';
import 'package:weather_app/screen/home/widgets/home_center_weather.dart';
import 'package:weather_app/screen/home/widgets/home_top_area.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeState>(
      builder: (con, state) {
        if (state.loader == true) {
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
      },
    );
  }
}
