import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:weather_app/common/helper.dart';
import 'package:weather_app/common/text_styles.dart';
import 'package:weather_app/common/widgets/today_list.dart';
import 'package:weather_app/screen/forecast/bloc/forecast_bloc.dart';
import 'package:weather_app/screen/forecast/bloc/forecast_event.dart';
import 'package:weather_app/screen/forecast/bloc/forecast_state.dart';
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
        BlocBuilder<ForecastBloc, ForecastState>(
          builder: (context, state) {
            return TodayList(
              weatherModel: state.forecast!,
              selectedIndex: state.selectedTimeSlot!,
              onTap: (int index) =>
                  context.read<ForecastBloc>().add(SelectForecastTime(index)),
              subTitle: DateFormat('MMMM dd, yyyy').format(DateTime.now()),
            );
          },
        ),
      ],
    );
  }
}
