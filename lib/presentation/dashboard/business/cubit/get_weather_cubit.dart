import 'package:bloc/bloc.dart';

import 'package:task_app/domain/entity/weather_entity.dart';
import 'package:task_app/domain/usecases/get_current_weather.dart';

class GetWeatherCubit extends Cubit<String> {
  final GetCurrentWeatherUsecase _getWeather;
  GetWeatherCubit({required GetCurrentWeatherUsecase getWeather})
      : _getWeather = getWeather,
        super("");

  Future<void> getWeatherFromDB() async {
    return await _handlingResponse();
  }

  Future<void> _handlingResponse() async {
    try {
      final data = await _getResponse();
      print("to jest $data");
      emit(data.temperature);
    } catch (e) {
      emit("");
    }
  }

  Future<WeatherEntity> _getResponse() async {
    return await _getWeather
        .execute()
        .then((response) => response.fold((l) => throw l, (r) => r));
  }
}
