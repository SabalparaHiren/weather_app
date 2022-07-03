import 'dart:async';

import 'package:weather_app/screen/map/widget/map_event.dart';
import 'package:weather_app/screen/map/widget/map_state.dart';
import 'package:weather_app/service/pref_service.dart';
import 'package:weather_app/utils/pref_keys.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MapBloc extends Bloc<MapEvent, MapState> {
  MapBloc() : super(MapState()) {
    on<MapInit>(init);
    on<GetMapUrl>(getMapUrl);
    on<ChangeMapLoader>(onLoaderChange);
  }

  FutureOr<void> init(MapInit event, Emitter<MapState> emit) {
    event.context.read<MapBloc>().add(GetMapUrl());
  }

  void getMapUrl(GetMapUrl event, Emitter<MapState> emit) {
    String mapUrl =
        'https://openweathermap.org/weathermap?basemap=map&cities=true&layer=temperature&lat='
        '${PrefService.getDouble(PrefKeys.latitude)}&lon=${PrefService.getDouble(PrefKeys.longitude)}&zoom=8';
    emit(state.copyWith(mapUrl: mapUrl));
  }

  FutureOr<void> onLoaderChange(ChangeMapLoader event, Emitter<MapState> emit) {
    emit(state.copyWith(loader: event.loader));
  }
}
