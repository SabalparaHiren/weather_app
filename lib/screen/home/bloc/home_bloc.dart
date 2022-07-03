import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/common/helper.dart';
import 'package:weather_app/model/weather_model.dart';
import 'package:weather_app/screen/home/api/home_api.dart';
import 'package:weather_app/screen/home/bloc/home_event.dart';
import 'package:weather_app/screen/home/bloc/home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeState()) {
    on<HomeInit>(init);
    on<GetWeatherModel>(getWeatherModel);
    on<SelectTime>(onTimeSelect);
  }

  Future<void> init(HomeInit event, Emitter<HomeState> emit) async {
    emit(state.copyWith(loader: true));
    await getCurrentLocation();
    event.context.read<HomeBloc>().add(GetWeatherModel());
  }

  Future<void> getWeatherModel(
      GetWeatherModel event, Emitter<HomeState> emit) async {
    emit(state.copyWith(loader: true));
    WeatherModel? model = await HomeApi.getAllWeatherData();
    if (model != null) {
      emit(state.copyWith(loader: false, weatherModel: model));
    }
    emit(state.copyWith(loader: false));
  }

  FutureOr<void> onTimeSelect(SelectTime event, Emitter<HomeState> emit) {
    emit(state.copyWith(selectedTimeSlot: event.index));
  }
}
