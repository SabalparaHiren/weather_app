import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/model/weather_model.dart';
import 'package:weather_app/screen/history/api/history_api.dart';
import 'package:weather_app/screen/history/bloc/history_event.dart';
import 'package:weather_app/screen/history/bloc/history_state.dart';

class HistoryBloc extends Bloc<HistoryEvent, HistoryState> {
  BuildContext? context;

  HistoryBloc() : super(HistoryState()) {
    on<HistoryInit>(init);
    on<GetLastWeekHistory>(getLastWeekHistory);
    on<OnHistoryTabChange>(onTabChange);
  }

  FutureOr<void> init(HistoryInit event, Emitter<HistoryState> emit) {
    event.context.read<HistoryBloc>().add(GetLastWeekHistory());
  }

  Future<void> getLastWeekHistory(
      GetLastWeekHistory event, Emitter<HistoryState> emit) async {
    emit(state.copyWith(loader: true));
    List<WeatherModel> history = await HistoryApi.getPast5DayHistory();
    emit(state.copyWith(history: history, loader: false));
  }

  FutureOr<void> onTabChange(
      OnHistoryTabChange event, Emitter<HistoryState> emit) {
    emit(state.copyWith(selectedIndex: event.index));
  }
}
