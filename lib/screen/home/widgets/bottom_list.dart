import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/common/helper.dart';
import 'package:weather_app/common/widgets/today_list.dart';
import 'package:weather_app/screen/home/home_provider.dart';

class BottomList extends StatelessWidget {
  const BottomList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: deviceHeight * 0.04),
        Consumer<HomeProvider>(
          builder: (con, provider, widget) {
            return TodayList(
              weatherModel: provider.weatherModel,
              selectedIndex: provider.selectedTimeSlot,
              onTap: provider.onTimeSelect,
            );
          },
        ),
      ],
    );
  }
}
