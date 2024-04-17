import 'package:dartz/dartz.dart';
import 'package:task_app/core/exception/hive_exceptions.dart';
import 'package:task_app/core/params/task_params.dart';
import 'package:task_app/data/sources/local/task_local_source.dart';
import 'package:task_app/domain/helpers/usecase_status.dart';
import 'package:task_app/domain/repository/task_repository.dart';

class TaskRepositoryImpl extends TaskRepository {
  TaskRepositoryImpl({required TaskLocalDataSource local}) : _local = local;
  final TaskLocalDataSource _local;
  @override
  Future<Either<Exception, UseCaseStatus>> addTask(TaskParams params) async {
    try {
      await _local.addTask(params..returnModel());
      return const Right(UseCaseStatus.success);
    } on HiveException catch (e) {
      return Left(e);
    } catch (e) {
      return Left(e as Exception);
    }
  }
}
