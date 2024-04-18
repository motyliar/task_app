import 'package:dartz/dartz.dart';
import 'package:task_app/core/exception/hive_exceptions.dart';
import 'package:task_app/core/params/task_params.dart';
import 'package:task_app/data/sources/local/task_local_source.dart';
import 'package:task_app/domain/entity/task_entity.dart';
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

  @override
  Future<Either<Exception, List<TaskEntity>>> getTasks() async {
    try {
      final tasks = await _local.getTasks();
      return Right(tasks.map((e) => e.toEntity()).toList());
    } on HiveException catch (e) {
      return Left(e);
    } catch (e) {
      return Left(e as Exception);
    }
  }

  @override
  Future<Either<Exception, void>> deleteTask(DeleteTaskParams params) async {
    try {
      final delete = await _local.deleteTask(params);
      return Right(delete);
    } on HiveException catch (e) {
      return Left(e);
    } catch (e) {
      return Left(e as Exception);
    }
  }

  @override
  Future<Either<Exception, void>> updateTask(UpdateTaskParams params) async {
    try {
      final update = await _local.updateTask(params);
      return Right(update);
    } on HiveException catch (e) {
      return Left(e);
    } on Exception catch (e) {
      return Left(e);
    }
  }
}
