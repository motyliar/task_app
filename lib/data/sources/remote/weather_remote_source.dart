import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:task_app/core/exception/service_exception.dart';

import 'package:task_app/core/params/weather_params.dart';
import 'package:task_app/data/models/weather_model.dart';

abstract class WeatherRemoteSource {
  Future<WeatherModel> getCurrentWeather(WeatherParams params);
}

class WeatherRemoteSourceImpl extends WeatherRemoteSource {
  WeatherRemoteSourceImpl({required this.client});
  final http.Client client;

  @override
  Future<WeatherModel> getCurrentWeather(WeatherParams params) async {
    try {
      final response = await client.get(params.getUrl());
      final data = jsonDecode(response.body)['current'];
      if (data != null) {
        return WeatherModel.fromJson(data);
      } else {
        throw ServiceException("Empty data");
      }
    } on Exception catch (e) {
      throw ServiceException(e.toString());
    }
  }
}
