import 'package:flutter/material.dart';

abstract class MapEvent {}

class MapInit extends MapEvent {
  final BuildContext context;

  MapInit(this.context);
}

class GetMapUrl extends MapEvent {}

class ChangeMapLoader extends MapEvent {
  final bool loader;

  ChangeMapLoader(this.loader);
}
