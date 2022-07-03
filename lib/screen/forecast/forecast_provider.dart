import 'package:flutter/material.dart';
import 'package:weather_app/model/weather_model.dart';
import 'package:weather_app/screen/forecast/api/forecast_api.dart';

class ForecastProvider extends ChangeNotifier {
  WeatherModel forecast = WeatherModel();
  bool loader = false;
  int selectedTimeSlot = 0;

  Future<void> init() async {
    await getForecastData();
  }

  Future<void> getForecastData() async {
    loader = true;
    notifyListeners();
    forecast = (await ForecastApi.getForecastData()) ?? WeatherModel();
    loader = false;
    notifyListeners();
  }

  void onTimeSelect(int index) {
    selectedTimeSlot = index;
    notifyListeners();
  }
}
