import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:task_app/core/params/weather_params.dart';

class GetLocalization {
  Future<Position> geoLocation() async {
    await Geolocator.checkPermission();
    await Geolocator.requestPermission();

    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.low);
    debugPrint(position.toString());
    return position;
  }

  Future<WeatherParams> getParams() async {
    final position = await geoLocation();
    final lat = position.latitude.toStringAsFixed(2);
    final lng = position.longitude.toStringAsFixed(2);
    return WeatherParams(lat: lat, lng: lng);
  }
}
