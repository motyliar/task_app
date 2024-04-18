import 'package:hive/hive.dart';

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:task_app/data/models/submodels/data_marker.dart';
import 'package:task_app/domain/subentity/data_marker.dart';
part 'data_stat_m.freezed.dart';
part 'data_stat_m.g.dart';

@freezed
@HiveType(typeId: 3)
class DataStatM with _$DataStatM {
  const DataStatM._();
  const factory DataStatM({
    @HiveField(0) required DataMarkerModel create,
    @HiveField(1) required DataMarkerModel execution,
    @HiveField(2) required DataMarkerModel done,
  }) = _DataStatM;
  factory DataStatM.fromJson(Map<String, dynamic> json) =>
      _$DataStatMFromJson(json);

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
