import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/common/widgets/loaders.dart';
import 'package:weather_app/screen/history/history_provider.dart';
import 'package:weather_app/screen/history/widgets/history_list.dart';
import 'package:weather_app/screen/history/widgets/history_top_area.dart';

class HistoryScreen extends StatelessWidget {
  const HistoryScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<HistoryProvider>(builder: (con, provider, widget) {
      if (provider.loader) {
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
    });
  }
}
