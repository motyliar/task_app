import 'package:dartz/dartz.dart';
import 'package:task_app/core/params/task_params.dart';
import 'package:task_app/domain/repository/task_repository.dart';

class UpdateTaskUsecase {
  const UpdateTaskUsecase({required TaskRepository repository})
      : _repository = repository;
  final TaskRepository _repository;

  Future<Either<Exception, void>> execute(UpdateTaskParams params) {
    return _repository.updateTask(params);
  }
}
