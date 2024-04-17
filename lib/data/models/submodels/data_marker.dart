import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';
import 'package:task_app/domain/subentity/data_marker.dart';
part 'data_marker.freezed.dart';
part 'data_marker.g.dart';

@freezed
@HiveType(typeId: 2)
class DataMarkerModel with _$DataMarkerModel {
  const DataMarkerModel._();
  const factory DataMarkerModel({
    @HiveField(0) required int day,
    @HiveField(1) required int month,
    @HiveField(2) required int year,
  }) = _DataMarkerModel;
  factory DataMarkerModel.fromJson(Map<String, dynamic> json) =>
      _$DataMarkerModelFromJson(json);

  static DataMarkerModel defaultValue() =>
      const DataMarkerModel(day: 0, month: 0, year: 0);
}

@freezed
@HiveField(3)
class DateStatModel with _$DateStatModel {
  const DateStatModel._();
  const factory DateStatModel({
    @HiveField(0) required DataMarkerModel create,
    @HiveField(1) required DataMarkerModel execution,
    @HiveField(2) required DataMarkerModel done,
  }) = _DateStatModel;
  factory DateStatModel.fromJson(Map<String, dynamic> json) =>
      _$DateStatModelFromJson(json);

  static DataMarkerModel currentDay() => DataMarkerModel(
      day: DateTime.now().day,
      month: DateTime.now().month,
      year: DateTime.now().year);

  DateMarker _convert(DataMarkerModel date) =>
      DateMarker(day: date.day, month: date.month, year: date.year);

  DateStat toEntity() => DateStat(
      create: _convert(create),
      execution: _convert(execution),
      done: _convert(done));
}
