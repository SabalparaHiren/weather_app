import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/common/helper.dart';
import 'package:weather_app/common/widgets/today_list.dart';
import 'package:weather_app/screen/home/bloc/home_bloc.dart';
import 'package:weather_app/screen/home/bloc/home_event.dart';
import 'package:weather_app/screen/home/bloc/home_state.dart';

class BottomList extends StatelessWidget {
  const BottomList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: deviceHeight * 0.04),
        BlocBuilder<HomeBloc, HomeState>(
          builder: (con, state) {
            return TodayList(
              weatherModel: state.weatherModel!,
              selectedIndex: state.selectedTimeSlot!,
              onTap: (int index) =>
                  context.read<HomeBloc>().add(SelectTime(index)),
            );
          },
        ),
      ],
    );
  }
}
