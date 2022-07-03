import 'package:flutter/material.dart';

abstract class HomeEvent {}

class HomeInit extends HomeEvent {
  final BuildContext context;

  HomeInit(this.context);
}

class GetWeatherModel extends HomeEvent {}

class SelectTime extends HomeEvent {
  final int index;

  SelectTime(this.index);
}
