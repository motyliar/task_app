import 'package:task_app/core/constans/weather_api.dart';
import 'package:task_app/core/params/i_params.dart';

class WeatherParams extends IParams {
  const WeatherParams({required this.lat, required this.lng});
  final String lng;
  final String lat;

  Uri getUrl() => Uri.parse(WeatherAPI().api(lat, lng));
}
