class TrackingData {
  final double latitude;
  final double longitude;
  final double heading;
  final String estimatedTimeOfArrival;

  const TrackingData({
    required this.latitude,
    required this.longitude,
    required this.heading,
    required this.estimatedTimeOfArrival,
  });
}
