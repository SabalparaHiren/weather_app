import 'package:weather_app/model/weather_model.dart';

class HomeState {
  int? selectedTimeSlot;
  WeatherModel? weatherModel;
  bool? loader;

  HomeState({
    this.selectedTimeSlot = 0,
    this.weatherModel,
    this.loader = false,
  });

  HomeState copyWith({
    int? selectedTimeSlot,
    WeatherModel? weatherModel,
    bool? loader,
  }) {
    return HomeState(
      loader: loader ?? this.loader,
      selectedTimeSlot: selectedTimeSlot ?? this.selectedTimeSlot,
      weatherModel: weatherModel ?? this.weatherModel,
    );
  }
}
