import 'package:weather_app/screen/dashboard/bloc/dashboard_bloc.dart';
import 'package:weather_app/screen/dashboard/bloc/dashboard_event.dart';
import 'package:weather_app/screen/dashboard/bloc/dashboard_state.dart';
import 'package:weather_app/screen/dashboard/widgets/bottom_bar.dart';
import 'package:weather_app/screen/forecast/forecast_screen.dart';
import 'package:weather_app/screen/history/history_screen.dart';
import 'package:weather_app/screen/home/home_screen.dart';
import 'package:weather_app/screen/map/map_screen.dart';
import 'package:weather_app/utils/color_res.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  @override
  void initState() {
    context.read<DashboardBloc>().add(ChangeDashboardTab(0, context));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
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
        child: BlocBuilder<DashboardBloc, DashboardState>(
          builder: (con, state) {
            if (state.currentTab == 0) {
              return const HomeScreen();
            } else if (state.currentTab == 1) {
              return const ForecastScreen();
            } else if (state.currentTab == 2) {
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
