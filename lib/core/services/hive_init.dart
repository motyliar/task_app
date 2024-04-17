import 'package:hive_flutter/adapters.dart';
import 'package:task_app/data/models/submodels/data_marker.dart';
import 'package:task_app/data/models/task_model.dart';

class HiveInit {
  Future<void> init() async {
    await _register();
    await _openBoxes();
  }
}

Future<void> _register() async {
  await Hive.initFlutter();
  Hive
    ..registerAdapter(TaskModelAdapter())
    ..registerAdapter(DataMarkerModelAdapter());
}

Future<void> _openBoxes() async {
  await Hive.openBox<TaskModel>('task-data');
}
