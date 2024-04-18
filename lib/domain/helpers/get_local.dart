import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

class GetLocalization {
  Future<Position> geoLocation() async {
    await Geolocator.checkPermission();
    await Geolocator.requestPermission();

    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.low);
    debugPrint(position.toString());
    return position;
  }
}
