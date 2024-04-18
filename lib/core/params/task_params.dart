// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:task_app/core/params/i_params.dart';
import 'package:task_app/data/models/submodels/data_marker.dart';
import 'package:task_app/data/models/submodels/data_stat_m.dart';
import 'package:task_app/data/models/task_model.dart';
import 'package:uuid/uuid.dart';

import 'package:task_app/domain/subentity/task_status.dart';

class TaskParams extends IParams {
  final String title;
  final String description;
  final DateTime deadline;
  final String owner;
  final bool isPriority;
  TaskParams({
    required this.title,
    required this.description,
    required this.deadline,
    required this.owner,
    required this.isPriority,
  });

  final stat = DataStatM(
      create: DataStatM.currentDay(),
      execution: DataMarkerModel.defaultValue(),
      done: DataMarkerModel.defaultValue());

  TaskModel returnModel() {
    var uuid = const Uuid();
    var uniqueId = uuid.v4();
    return TaskModel(
        id: uniqueId,
        title: title,
        description: description,
        deadline: deadline,
        owner: owner,
        status: TaskStatus.planned.name,
        stat: stat,
        isPriroity: isPriority);
  }
}

class DeleteTaskParams extends IParams {
  const DeleteTaskParams({required this.id});
  final String id;
}

class UpdateTaskParams extends IParams {
  const UpdateTaskParams({required this.id, required this.task});
  final String id;
  final TaskModel task;
}
