import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';

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
