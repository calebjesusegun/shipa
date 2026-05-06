class AppConstants {
  AppConstants._();

  static const String mapboxToken = String.fromEnvironment('ACCESS_TOKEN');

  static const String directionsBaseUrl =
      'https://api.mapbox.com/directions/v5/mapbox/driving';

  static const String geocodingBaseUrl =
      'https://api.mapbox.com/geocoding/v5/mapbox.places';

  static const String pin = 'assets/svg/pin.svg';
  static const String timer = 'assets/svg/timer.svg';
}
