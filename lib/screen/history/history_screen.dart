import 'package:weather_app/common/widgets/loaders.dart';
import 'package:weather_app/screen/history/bloc/history_bloc.dart';
import 'package:weather_app/screen/history/bloc/history_state.dart';
import 'package:weather_app/screen/history/widgets/history_list.dart';
import 'package:weather_app/screen/history/widgets/history_top_area.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HistoryScreen extends StatelessWidget {
  const HistoryScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HistoryBloc, HistoryState>(
      builder: (con, state) {
        if (state.loader == true) {
          return const SmallLoader();
        } else {
          return SafeArea(
            child: Column(
              children: const [
                HistoryTopArea(),
                HistoryList(),
              ],
            ),
          );
        }
      },
    );
  }
}
