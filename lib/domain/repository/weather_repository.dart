import 'package:dartz/dartz.dart';

import 'package:task_app/domain/entity/weather_entity.dart';

abstract class WeatherRepository {
  Future<Either<Exception, WeatherEntity>> getCurrentWeather();
}
