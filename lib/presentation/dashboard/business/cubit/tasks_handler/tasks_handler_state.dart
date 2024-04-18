part of 'tasks_handler_cubit.dart';

class TasksHandlerState {
  const TasksHandlerState({this.tasks = const <TaskEntity>[]});
  final List<TaskEntity> tasks;
}

class TasksHandlerStateLoading extends TasksHandlerState {
  TasksHandlerStateLoading(List<TaskEntity> tasks) : super(tasks: tasks);
}

class TasksHandlerFailed extends TasksHandlerState {
  TasksHandlerFailed(List<TaskEntity> tasks) : super(tasks: tasks);
}
