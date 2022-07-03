import 'package:weather_app/model/weather_model.dart';

class ForecastState {
  WeatherModel? forecast;
  bool? loader;
  int? selectedTimeSlot;

  ForecastState({
    this.forecast,
    this.loader = false,
    this.selectedTimeSlot = 0,
  });

  ForecastState copyWith({
    WeatherModel? forecast,
    bool? loader,
    int? selectedTimeSlot,
  }) {
    return ForecastState(
      forecast: forecast ?? this.forecast,
      selectedTimeSlot: selectedTimeSlot ?? this.selectedTimeSlot,
      loader: loader ?? this.loader,
    );
  }
}
