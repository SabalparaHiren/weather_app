import 'package:flutter/cupertino.dart';
import 'package:weather_app/model/weather_model.dart';
import 'package:weather_app/screen/history/api/history_api.dart';

class HistoryProvider extends ChangeNotifier {
  List<WeatherModel> history = [];
  bool loader = false;
  int selectedIndex = 0;

  Future<void> init() async {
    await getLastWeekList();
  }

  Future<void> getLastWeekList() async {
    loader = true;
    notifyListeners();
    history = await HistoryApi.getPast5DayHistory();
    loader = false;
    notifyListeners();
  }

  void onTabChange(int index) {
    selectedIndex = index;
    notifyListeners();
  }
}
