import 'package:weather_app/model/weather_model.dart';

class HistoryState {
  List<WeatherModel>? history;
  bool? loader;
  int? selectedIndex;

  HistoryState({
    this.history = const [],
    this.loader = false,
    this.selectedIndex = 0,
  });

  HistoryState copyWith({
    List<WeatherModel>? history,
    bool? loader,
    int? selectedIndex,
  }) {
    return HistoryState(
      history: history ?? this.history,
      loader: loader ?? this.loader,
      selectedIndex: selectedIndex ?? this.selectedIndex,
    );
  }
}
