import 'package:dartz/dartz.dart';
import 'package:task_app/core/exception/service_exception.dart';
import 'package:task_app/core/params/weather_params.dart';
import 'package:task_app/data/sources/remote/weather_remote_source.dart';
import 'package:task_app/domain/entity/weather_entity.dart';
import 'package:task_app/domain/repository/weather_repository.dart';

class WeatherRepositoryImpl extends WeatherRepository {
  WeatherRepositoryImpl({required WeatherRemoteSource remote})
      : _remote = remote;
  final WeatherRemoteSource _remote;

  @override
  Future<Either<Exception, WeatherEntity>> getCurrentWeather(
      WeatherParams params) async {
    try {
      return await _remote
          .getCurrentWeather(params)
          .then((response) => Right(response.toEntity()));
    } on ServiceException catch (e) {
      return Left(e);
    } on Exception catch (e) {
      return Left(e);
    }
  }
}
