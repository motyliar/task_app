import 'package:bloc/bloc.dart';
import 'package:task_app/core/params/weather_params.dart';
import 'package:task_app/domain/entity/weather_entity.dart';
import 'package:task_app/domain/usecases/get_current_weather.dart';

class GetWeatherCubit extends Cubit<String> {
  final GetCurrentWeatherUsecase _getWeather;
  GetWeatherCubit({required GetCurrentWeatherUsecase getWeather})
      : _getWeather = getWeather,
        super("");

  Future<void> getWeather(WeatherParams params) async {
    return await _handlingResponse(params);
  }

  Future<void> _handlingResponse(WeatherParams params) async {
    try {
      final data = await _getResponse(params);
      emit(data.temperature);
    } catch (e) {
      emit("");
    }
  }

  Future<WeatherEntity> _getResponse(WeatherParams params) async {
    return await _getWeather
        .execute(params)
        .then((response) => response.fold((l) => throw l, (r) => r));
  }
}
