import 'package:flutter/cupertino.dart';
import 'package:weather_app/common/helper.dart';
import 'package:weather_app/model/weather_model.dart';
import 'package:weather_app/screen/home/api/home_api.dart';

class HomeProvider extends ChangeNotifier {
  int selectedTimeSlot = 0;

  WeatherModel weatherModel = WeatherModel();
  bool loader = false;

  Future<void> init() async {
    loader = true;
    await getCurrentLocation();
    await getWeatherModel();
  }

  void onFullReportTap() {}

  void onTimeSelect(int index) {
    selectedTimeSlot = index;
    notifyListeners();
  }

  Future<void> getWeatherModel() async {
    loader = true;
    notifyListeners();
    WeatherModel? model = await HomeApi.getAllWeatherData();
    if (model == null) {
      getWeatherModel();
    } else {
      weatherModel = model;
      loader = false;
      notifyListeners();
    }
  }
}
