import 'package:flutter/material.dart';

abstract class ForecastEvent {}

class ForecastInit extends ForecastEvent {
  final BuildContext context;

  ForecastInit(this.context);
}

class GetForecastData extends ForecastEvent {}

class SelectForecastTime extends ForecastEvent {
  final int index;

  SelectForecastTime(this.index);
}
