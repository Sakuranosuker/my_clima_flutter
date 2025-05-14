import 'package:geolocator/geolocator.dart';
import 'package:flutter/material.dart';

class Location {
  double latitude = 0;
  double longitude = 0;

  Future<void> getCurrentLocation() async {
    LocationPermission permission;
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('Location permissions are denied');
      }
    }
    final LocationSettings locationSettings =
        LocationSettings(accuracy: LocationAccuracy.low);

    Position position =
        await Geolocator.getCurrentPosition(locationSettings: locationSettings);
    latitude = position.latitude;
    longitude = position.longitude;
  }
}
