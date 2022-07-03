import 'package:flutter/cupertino.dart';

abstract class DashboardEvent {}

class ChangeDashboardTab extends DashboardEvent {
  final int index;
  final BuildContext context;

  ChangeDashboardTab(this.index, this.context);
}
