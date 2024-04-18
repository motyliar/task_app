import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:task_app/core/exception/service_exception.dart';

import 'package:task_app/data/models/weather_model.dart';
import 'package:task_app/domain/helpers/get_local.dart';

abstract class WeatherRemoteSource {
  Future<WeatherModel> getCurrentWeather();
}

class WeatherRemoteSourceImpl extends WeatherRemoteSource {
  WeatherRemoteSourceImpl({required this.client});
  final http.Client client;

  @override
  Future<WeatherModel> getCurrentWeather() async {
    var params = await GetLocalization().getParams();
    try {
      final response = await client.get(params.getUrl());
      final data = jsonDecode(response.body)['current'];
      print(response.body);
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
