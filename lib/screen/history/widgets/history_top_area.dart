import 'package:weather_app/common/helper.dart';
import 'package:weather_app/common/text_styles.dart';
import 'package:weather_app/utils/strings.dart';
import 'package:flutter/material.dart';

class HistoryTopArea extends StatelessWidget {
  const HistoryTopArea({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: deviceHeight * 0.03),
        Text(Strings.historicalWeather, style: title),
        SizedBox(height: deviceHeight * 0.04),
      ],
    );
  }
}
