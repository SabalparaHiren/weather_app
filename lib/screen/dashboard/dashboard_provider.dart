import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/screen/forecast/forecast_provider.dart';
import 'package:weather_app/screen/history/history_provider.dart';
import 'package:weather_app/screen/home/home_provider.dart';
import 'package:weather_app/screen/map/map_provider.dart';

class DashboardProvider extends ChangeNotifier {
  int currentTab = 0;
  late HomeProvider homeProvider;
  late ForecastProvider forecastProvider;
  late HistoryProvider historyProvider;
  late MapProvider mapProvider;

  void initAllProvider(BuildContext context) {
    homeProvider = Provider.of<HomeProvider>(context, listen: false);
    forecastProvider = Provider.of<ForecastProvider>(context, listen: false);
    historyProvider = Provider.of<HistoryProvider>(context, listen: false);
    mapProvider = Provider.of<MapProvider>(context, listen: false);
    homeProvider.init();
  }

  void onBottomBarChange(int index) {
    currentTab = index;
    if (index == 0) {
      homeProvider.init();
    } else if (index == 1) {
      forecastProvider.init();
    } else if (index == 2) {
      historyProvider.init();
    } else {
      mapProvider.init();
    }
    notifyListeners();
  }
}
