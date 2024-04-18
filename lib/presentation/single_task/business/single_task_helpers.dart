import 'package:task_app/data/models/task_model.dart';
import 'package:task_app/domain/entity/task_entity.dart';

class SingleTaskHelpers {
  static TaskModel covertToModelWithNewStatus(
      TaskEntity entity, String status) {
    return TaskModel(
        title: entity.title,
        description: entity.description,
        deadline: entity.deadline,
        owner: entity.owner,
        status: status,
        stat: entity.stat.toModel(status),
        isPriroity: entity.isPriority,
        id: entity.id);
  }
}
