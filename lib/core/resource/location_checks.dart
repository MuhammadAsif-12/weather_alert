import 'package:weather_home_screen/core/resource/constants.dart';
import 'dart:async';
import 'package:geolocator/geolocator.dart';
import 'package:location/location.dart' as loc;
import 'package:permission_handler/permission_handler.dart';


enum LocationStatus {
  permissionDenied,
  permissionDeniedForever,
  gpsDisabled, //top priority
  ok;

  static Future<LocationStatus> checkLocationStatus() async {
    loc.Location location = loc.Location();

    // Check if the location permission is granted
    loc.PermissionStatus permissionGranted = await location.hasPermission();
    if (permissionGranted == loc.PermissionStatus.denied) {
      return LocationStatus.permissionDenied;
    } else if (permissionGranted == loc.PermissionStatus.deniedForever) {
      return LocationStatus.permissionDeniedForever;
    }

    bool serviceEnabled = await location.serviceEnabled();
    if (!serviceEnabled) {
      return LocationStatus.gpsDisabled;
    }

    return LocationStatus.ok;
  }

  static Future<bool> hasLocationPermissions() async {
    loc.Location location = loc.Location();
    loc.PermissionStatus permissionGranted = await location.hasPermission();
    return (permissionGranted == loc.PermissionStatus.granted ||
        permissionGranted == loc.PermissionStatus.grantedLimited);
  }

  static Future<bool> isGpsEnabled() async {
    loc.Location location = loc.Location();
    bool serviceEnabled = await location.serviceEnabled();
    return serviceEnabled;
  }

  static openSettings(LocationStatus locationStatus) async {
    switch (locationStatus) {
      case LocationStatus.permissionDenied:
        await Permission.location.request();
        break;
      case LocationStatus.permissionDeniedForever:
        await openAppSettings();
        break;
      case LocationStatus.gpsDisabled:
        loc.Location location = loc.Location();
        location.requestService();
        break;
      case LocationStatus.ok:
        break;
    }
  }

  static Future<Position> fetchGpsLocation({
    double? fallbackLat,
    double? fallbackLong,
  }) async {
    // Step 1: Check Location Status
    var status = await checkLocationStatus();
    if (status != LocationStatus.ok) {
      return _getFallbackPosition(fallbackLat, fallbackLong);
    }

    try {
      var accuracy = await Geolocator.getLocationAccuracy();
      if (accuracy == LocationAccuracyStatus.reduced) {
        print("Using reduced location accuracy.");
        return await Geolocator.getCurrentPosition(
          forceAndroidLocationManager: true,
          locationSettings: const LocationSettings(
            accuracy: LocationAccuracy.low,
            timeLimit: Duration(seconds: 60),
          ),
        );
      }

      // Step 3: Request High Accuracy Location
      return await Geolocator.getCurrentPosition(
        locationSettings: const LocationSettings(
          accuracy: LocationAccuracy.high,
          timeLimit: Duration(seconds: 60),
        ),
      );
    } on TimeoutException {
      print("Location request timed out. Returning fallback position.");
      return _getFallbackPosition(fallbackLat, fallbackLong);
    } catch (e) {
      print("Error fetching location: $e. Returning fallback position.");
      return _getFallbackPosition(fallbackLat, fallbackLong);
    }
  }

// Helper Method to Generate Fallback Position
  static Position _getFallbackPosition(
      double? fallbackLat, double? fallbackLong) {
    return Position(
      longitude: fallbackLong ?? DEFAULT_LAT,
      latitude: fallbackLat ?? DEFAULT_LAT,
      timestamp: DateTime.now(),
      accuracy: 0, // Indicate fallback with zero accuracy
      altitude: 0,
      altitudeAccuracy: 0,
      heading: 0,
      headingAccuracy: 0,
      speed: 0,
      speedAccuracy: 0,
    );
  }

  String getMessage() {
    switch (this) {
      case LocationStatus.permissionDenied:
        return "Your location is disabled. You will only see the weather of our HQ. To view your current locations’ weather, please enable location permissions in your device.";
      case LocationStatus.permissionDeniedForever:
        return "Your location is disabled. You will only see the weather of our HQ. To view your current locations’ weather, please enable location permissions in your device.";
      case LocationStatus.gpsDisabled:
        return "Your location is disabled. You will only see the weather of our HQ. To view your current locations’ weather, please enable location services in your device.";
      case LocationStatus.ok:
        return 'Location and GPS are enabled.';
    }
  }
}