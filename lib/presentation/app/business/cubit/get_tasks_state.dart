part of 'get_tasks_cubit.dart';

class GetTasksState {
  const GetTasksState({this.tasks = const <TaskEntity>[]});
  final List<TaskEntity> tasks;
}

class GetTaskStateLoading extends GetTasksState {
  GetTaskStateLoading(List<TaskEntity> tasks) : super(tasks: tasks);
}

class GetTasksFailed extends GetTasksState {
  GetTasksFailed(List<TaskEntity> tasks) : super(tasks: tasks);
}
