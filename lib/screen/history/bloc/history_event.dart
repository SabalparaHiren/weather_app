import 'package:flutter/material.dart';

abstract class HistoryEvent {}

class HistoryInit extends HistoryEvent {
  final BuildContext context;

  HistoryInit(this.context);
}

class GetLastWeekHistory extends HistoryEvent {}

class OnHistoryTabChange extends HistoryEvent {
  final int index;

  OnHistoryTabChange(this.index);
}
