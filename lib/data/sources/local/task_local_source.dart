import 'package:hive/hive.dart';
import 'package:task_app/core/params/task_params.dart';
import 'package:task_app/data/models/task_model.dart';

abstract class TaskLocalDataSource {
  Future<void> addTask(TaskParams params);
}

class TaskLocalDataSourceImpl extends TaskLocalDataSource {
  final Box<TaskModel> localTaskDB = Hive.box<TaskModel>('task-data');

  @override
  Future<void> addTask(TaskParams params) async {
    await localTaskDB.add(params.returnModel());
  }
}
