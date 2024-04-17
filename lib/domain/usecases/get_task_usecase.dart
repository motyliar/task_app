import 'package:dartz/dartz.dart';
import 'package:task_app/domain/entity/task_entity.dart';
import 'package:task_app/domain/repository/task_repository.dart';

class GetTaskUsecase {
  const GetTaskUsecase({required TaskRepository repository})
      : _repository = repository;
  final TaskRepository _repository;

  Future<Either<Exception, List<TaskEntity>>> execute() {
    return _repository.getTasks();
  }
}
