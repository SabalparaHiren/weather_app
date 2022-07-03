import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:simple_shadow/simple_shadow.dart';
import 'package:weather_app/common/helper.dart';
import 'package:weather_app/common/text_styles.dart';
import 'package:weather_app/screen/home/bloc/home_bloc.dart';
import 'package:weather_app/screen/home/bloc/home_state.dart';
import 'package:weather_app/utils/color_res.dart';
import 'package:weather_app/utils/strings.dart';

class HomeCenterWeather extends StatelessWidget {
  const HomeCenterWeather({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeState>(
      builder: (context, state) {
        return Column(
          children: [
            SizedBox(height: deviceHeight * 0.06),
            SimpleShadow(
              opacity: 0.35,
              color: ColorRes.themeColor,
              offset: const Offset(0, 5),
              sigma: 20,
              child: Image.asset(
                getImageFromWeather(state.weatherModel!.current == null
                    ? ''
                    : state.weatherModel!.current!.weather!.first.main ?? ''),
                height: deviceHeight * 0.33,
                fit: BoxFit.fitHeight,
              ),
            ),
            SizedBox(height: deviceHeight * 0.05),
            Row(
              children: [
                infoTab(
                  Strings.temp,
                  '${kelToCel(state.weatherModel!.current!.temp ?? 0).toStringAsFixed(2)}°',
                ),
                infoTab(
                  Strings.wind,
                  '${state.weatherModel!.current!.windSpeed}km/h',
                ),
                infoTab(
                  Strings.humidity,
                  '${state.weatherModel!.current!.humidity}%',
                ),
              ],
            ),
          ],
        );
      },
    );
  }

  Widget infoTab(String title, String value) {
    return Expanded(
      child: Column(
        children: [
          Text(title, style: subTitle),
          SizedBox(height: deviceHeight * 0.008),
          Text(value, style: text1),
        ],
      ),
    );
  }
}
