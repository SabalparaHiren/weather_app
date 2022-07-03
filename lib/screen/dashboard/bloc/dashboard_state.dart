class DashboardState {
  int? currentTab;

  DashboardState({this.currentTab = 0});

  DashboardState copyWith({int? currentTab}) {
    return DashboardState(currentTab: currentTab ?? this.currentTab);
  }
}
