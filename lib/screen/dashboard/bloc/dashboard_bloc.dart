import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/screen/dashboard/bloc/dashboard_event.dart';
import 'package:weather_app/screen/dashboard/bloc/dashboard_state.dart';
import 'package:weather_app/screen/forecast/bloc/forecast_bloc.dart';
import 'package:weather_app/screen/forecast/bloc/forecast_event.dart';
import 'package:weather_app/screen/history/bloc/history_bloc.dart';
import 'package:weather_app/screen/history/bloc/history_event.dart';
import 'package:weather_app/screen/home/bloc/home_bloc.dart';
import 'package:weather_app/screen/home/bloc/home_event.dart';
import 'package:weather_app/screen/map/widget/map_bloc.dart';
import 'package:weather_app/screen/map/widget/map_event.dart';

class DashboardBloc extends Bloc<DashboardEvent, DashboardState> {
  DashboardBloc() : super(DashboardState()) {
    on<ChangeDashboardTab>(onBottomBarChange);
  }

  FutureOr<void> onBottomBarChange(
      ChangeDashboardTab event, Emitter<DashboardState> emit) {
    if (event.index == 0) {
      event.context.read<HomeBloc>().add(HomeInit(event.context));
    } else if (event.index == 1) {
      event.context.read<ForecastBloc>().add(ForecastInit(event.context));
    } else if (event.index == 2) {
      event.context.read<HistoryBloc>().add(HistoryInit(event.context));
    } else if (event.index == 3) {
      event.context.read<MapBloc>().add(MapInit(event.context));
    }
    emit(state.copyWith(currentTab: event.index));
  }
}
