import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/common/helper.dart';
import 'package:weather_app/common/text_styles.dart';
import 'package:weather_app/model/weather_model.dart';
import 'package:weather_app/screen/forecast/bloc/forecast_bloc.dart';
import 'package:weather_app/screen/forecast/bloc/forecast_state.dart';
import 'package:weather_app/utils/color_res.dart';
import 'package:weather_app/utils/strings.dart';

class ForecastList extends StatelessWidget {
  const ForecastList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        children: [
          SizedBox(height: deviceHeight * 0.05),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: deviceWidth * 0.05),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(Strings.nextForecast, style: header),
            ),
          ),
          SizedBox(height: deviceHeight * 0.03),
          BlocBuilder<ForecastBloc, ForecastState>(
            builder: (context, state) {
              return Expanded(
                child: ListView.builder(
                  padding: EdgeInsets.symmetric(horizontal: deviceWidth * 0.05),
                  itemCount: state.forecast!.daily == null
                      ? 0
                      : state.forecast!.daily!.length,
                  itemBuilder: (context, index) {
                    final Daily model = state.forecast!.daily![index];
                    return Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 18, vertical: 12),
                      margin: const EdgeInsets.only(bottom: 20),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: ColorRes.darkBlue,
                      ),
                      child: Row(
                        children: [
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  getDateFormatFromMillS('EEEE', model.dt!),
                                  style: text1,
                                ),
                                const SizedBox(height: 7),
                                Text(
                                  getDateFormatFromMillS('MMM, dd', model.dt!),
                                  style: subHeader,
                                ),
                              ],
                            ),
                          ),
                          Expanded(
                            child: Center(
                              child: Text(
                                "${kelToCel(model.temp!.day!).round()}°c",
                                style: large,
                              ),
                            ),
                          ),
                          Expanded(
                            child: Align(
                              alignment: Alignment.centerRight,
                              child: Image.asset(
                                getImageFromWeather(model.weather!.first.main!),
                                height: deviceHeight * 0.08,
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
