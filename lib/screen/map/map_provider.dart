import 'package:flutter/cupertino.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:weather_app/service/pref_service.dart';
import 'package:weather_app/utils/pref_keys.dart';

class MapProvider extends ChangeNotifier {
  String mapUrl = "";
  bool loader = false;

  void init() {
    getMapUrl();
  }

  void getMapUrl() {
    mapUrl =
        'https://openweathermap.org/weathermap?basemap=map&cities=true&layer=temperature&lat='
        '${PrefService.getDouble(PrefKeys.latitude)}&lon=${PrefService.getDouble(PrefKeys.longitude)}&zoom=8';
  }

  void onLoadStart(InAppWebViewController controller, Uri? uri) {
    loader = true;
    notifyListeners();
  }

  void onLoadStop(InAppWebViewController controller, Uri? uri) {
    loader = false;
    notifyListeners();
  }

  void onWebViewCreated(InAppWebViewController controller) {
    loader = true;
    notifyListeners();
  }
}
