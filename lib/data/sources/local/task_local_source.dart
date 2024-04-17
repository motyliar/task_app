import 'package:hive/hive.dart';
import 'package:task_app/core/exception/hive_exceptions.dart';
import 'package:task_app/core/params/task_params.dart';
import 'package:task_app/data/models/task_model.dart';

abstract class TaskLocalDataSource {
  Future<void> addTask(TaskParams params);
  Future<List<TaskModel>> getTasks();
}

class TaskLocalDataSourceImpl extends TaskLocalDataSource {
  final Box<TaskModel> localTaskDB = Hive.box<TaskModel>('task-data');

  @override
  Future<void> addTask(TaskParams params) async {
    try {
      await localTaskDB.add(params.returnModel());
    } catch (e) {
      throw HiveException(e.toString());
    }
  }

  @override
  Future<List<TaskModel>> getTasks() async {
    try {
      final tasks = localTaskDB.values.toList();
      return _handlingResponse(tasks);
    } catch (e) {
      throw HiveException.get(e.toString());
    }
  }

  List<TaskModel> _handlingResponse(List<TaskModel> response) {
    if (response.isEmpty) {
      return <TaskModel>[];
    } else {
      return response;
    }
  }
}
