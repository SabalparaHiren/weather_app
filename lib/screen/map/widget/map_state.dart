class MapState {
  String? mapUrl;
  bool? loader;

  MapState({
    this.mapUrl,
    this.loader = false,
  });

  MapState copyWith({
    String? mapUrl,
    bool? loader,
  }) {
    return MapState(
      mapUrl: mapUrl ?? this.mapUrl,
      loader: loader ?? this.loader,
    );
  }
}
