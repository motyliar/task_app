import 'package:dartz/dartz.dart';
import 'package:task_app/core/params/task_params.dart';
import 'package:task_app/domain/entity/task_entity.dart';
import 'package:task_app/domain/helpers/usecase_status.dart';

abstract class TaskRepository {
  Future<Either<Exception, UseCaseStatus>> addTask(TaskParams params);
  Future<Either<Exception, List<TaskEntity>>> getTasks();
  Future<Either<Exception, void>> deleteTask(DeleteTaskParams params);
}
