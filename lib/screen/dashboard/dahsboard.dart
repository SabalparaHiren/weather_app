import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/screen/dashboard/dashboard_provider.dart';
import 'package:weather_app/screen/dashboard/widgets/bottom_bar.dart';
import 'package:weather_app/screen/forecast/forecast_screen.dart';
import 'package:weather_app/screen/history/history_screen.dart';
import 'package:weather_app/screen/home/home_screen.dart';
import 'package:weather_app/screen/map/map_screen.dart';
import 'package:weather_app/utils/color_res.dart';

class Dashboard extends StatelessWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final DashboardProvider provider = Provider.of<DashboardProvider>(context);
    provider.initAllProvider(context);
    return Scaffold(
      backgroundColor: ColorRes.bgColor2,
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              ColorRes.bgColor1,
              ColorRes.bgColor2,
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Consumer<DashboardProvider>(
          builder: (con, provider, widget) {
            if (provider.currentTab == 0) {
              return const HomeScreen();
            } else if (provider.currentTab == 1) {
              return const ForecastScreen();
            } else if (provider.currentTab == 2) {
              return const HistoryScreen();
            } else {
              return const MapScreen();
            }
          },
        ),
      ),
      bottomNavigationBar: const BottomBar(),
    );
  }
}
