import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';
import 'package:task_app/data/models/submodels/data_marker.dart';

part 'task_model.freezed.dart';
part 'task_model.g.dart';

@freezed
@HiveType(typeId: 1)
class TaskModel with _$TaskModel {
  const TaskModel._();
  const factory TaskModel({
    @HiveField(0) required String title,
    @HiveField(1) required String description,
    @HiveField(2) required DateTime deadline,
    @HiveField(3) required String owner,
    @HiveField(4) required String status,
    @HiveField(5) required DateStatModel stat,
    @HiveField(6) required bool isPriroity,
  }) = _TaskModel;
  factory TaskModel.fromJson(Map<String, dynamic> json) =>
      _$TaskModelFromJson(json);
}
