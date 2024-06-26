import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';
import 'package:task_app/data/models/submodels/data_stat_m.dart';

import 'package:task_app/domain/entity/task_entity.dart';
import 'package:task_app/domain/subentity/task_status.dart';

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
    @HiveField(5) required DataStatM stat,
    @HiveField(6) required bool isPriroity,
    @HiveField(7) required String id,
  }) = _TaskModel;
  factory TaskModel.fromJson(Map<String, dynamic> json) =>
      _$TaskModelFromJson(json);

  TaskEntity toEntity() => TaskEntity(
      id: id,
      title: title,
      description: description,
      deadline: deadline,
      isPriority: isPriroity,
      owner: owner,
      status: convertStatus(status),
      stat: stat.toEntity());
}
