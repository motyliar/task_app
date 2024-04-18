import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:task_app/domain/entity/weather_entity.dart';
part 'weather_model.freezed.dart';
part 'weather_model.g.dart';

@freezed
class WeatherModel with _$WeatherModel {
  const WeatherModel._();
  const factory WeatherModel({
    // ignore: invalid_annotation_target
    @JsonKey(name: "temperature_2m") required double temperature,
  }) = _WeatherModel;
  factory WeatherModel.fromJson(Map<String, dynamic> json) =>
      _$WeatherModelFromJson(json);

  WeatherEntity toEntity() =>
      WeatherEntity(temperature: temperature.toString());
}
