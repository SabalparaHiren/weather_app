import 'dart:async';

import 'package:weather_app/model/weather_model.dart';
import 'package:weather_app/screen/forecast/api/forecast_api.dart';
import 'package:weather_app/screen/forecast/bloc/forecast_event.dart';
import 'package:weather_app/screen/forecast/bloc/forecast_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ForecastBloc extends Bloc<ForecastEvent, ForecastState> {
  ForecastBloc() : super(ForecastState()) {
    on<ForecastInit>(init);
    on<GetForecastData>(getForecastData);
    on<SelectForecastTime>(onTimeSelect);
  }

  FutureOr<void> init(ForecastInit event, Emitter<ForecastState> emit) {
    event.context.read<ForecastBloc>().add(GetForecastData());
  }

  Future<void> getForecastData(
      GetForecastData event, Emitter<ForecastState> emit) async {
    emit(state.copyWith(loader: true));
    WeatherModel? forecast = await ForecastApi.getForecastData();
    if (forecast != null) {
      emit(state.copyWith(forecast: forecast));
    }
    emit(state.copyWith(loader: false));
  }

  FutureOr<void> onTimeSelect(
      SelectForecastTime event, Emitter<ForecastState> emit) {
    emit(state.copyWith(selectedTimeSlot: event.index));
  }
}
