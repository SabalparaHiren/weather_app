import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/common/helper.dart';
import 'package:weather_app/common/text_styles.dart';
import 'package:weather_app/common/widgets/today_list.dart';
import 'package:weather_app/screen/forecast/forecast_provider.dart';
import 'package:weather_app/utils/strings.dart';

class ForecastTopArea extends StatelessWidget {
  const ForecastTopArea({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: deviceHeight * 0.03),
        Text(Strings.forecastReport, style: title),
        SizedBox(height: deviceHeight * 0.04),
        Consumer<ForecastProvider>(
          builder: (con, provider, widget) {
            return TodayList(
              weatherModel: provider.forecast,
              selectedIndex: provider.selectedTimeSlot,
              onTap: provider.onTimeSelect,
              subTitle: DateFormat('MMMM dd, yyyy').format(DateTime.now()),
            );
          },
        ),
      ],
    );
  }
}
