import 'package:dartz/dartz.dart';

abstract class TaskRepository {
  Either<Exception, void> addTask();
}
