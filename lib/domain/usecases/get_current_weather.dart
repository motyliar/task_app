import 'package:dartz/dartz.dart';
import 'package:task_app/core/params/weather_params.dart';
import 'package:task_app/domain/entity/weather_entity.dart';
import 'package:task_app/domain/repository/weather_repository.dart';

class GetCurrentWeatherUsecase {
  const GetCurrentWeatherUsecase({required WeatherRepository repository})
      : _repository = repository;

  final WeatherRepository _repository;

  Future<Either<Exception, WeatherEntity>> execute() {
    return _repository.getCurrentWeather();
  }
}
