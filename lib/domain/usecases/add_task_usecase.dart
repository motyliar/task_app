import 'package:dartz/dartz.dart';
import 'package:task_app/core/params/task_params.dart';
import 'package:task_app/domain/helpers/usecase_status.dart';
import 'package:task_app/domain/repository/task_repository.dart';

class AddTaskUseCase {
  const AddTaskUseCase({required TaskRepository repository})
      : _repository = repository;
  final TaskRepository _repository;

  Future<Either<Exception, UseCaseStatus>> execute(TaskParams params) {
    return _repository.addTask(params);
  }
}
