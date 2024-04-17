import 'package:dartz/dartz.dart';
import 'package:task_app/core/params/task_params.dart';
import 'package:task_app/domain/repository/task_repository.dart';

class DeleteTaskUseCase {
  const DeleteTaskUseCase({required TaskRepository repository})
      : _repository = repository;
  final TaskRepository _repository;

  Future<Either<Exception, void>> execute(DeleteTaskParams params) {
    return _repository.deleteTask(params);
  }
}
