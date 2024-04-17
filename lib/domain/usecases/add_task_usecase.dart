import 'package:dartz/dartz.dart';
import 'package:task_app/domain/helpers/usecase_status.dart';
import 'package:task_app/domain/repository/task_repository.dart';

class AddTaskUseCase {
  const AddTaskUseCase({required TaskRepository repository})
      : _repository = repository;
  final TaskRepository _repository;

  Either<Exception, UseCaseStatus> execute() {
    return _repository.addTask();
  }
}
