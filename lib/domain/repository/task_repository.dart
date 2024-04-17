import 'package:dartz/dartz.dart';
import 'package:task_app/domain/helpers/usecase_status.dart';

abstract class TaskRepository {
  Either<Exception, UseCaseStatus> addTask();
}
