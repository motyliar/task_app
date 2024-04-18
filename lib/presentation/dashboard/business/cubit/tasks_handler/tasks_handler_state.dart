part of 'tasks_handler_cubit.dart';

class TasksHandlerState extends Equatable {
  const TasksHandlerState({this.tasks = const <TaskEntity>[]});
  final List<TaskEntity> tasks;

  @override
  List<Object> get props => [tasks];
}

class TasksHandlerStateLoading extends TasksHandlerState {
  const TasksHandlerStateLoading(List<TaskEntity> tasks) : super(tasks: tasks);

  @override
  List<Object> get props => [tasks];
}

class TaskHandlerStateLoaded extends TasksHandlerState {
  const TaskHandlerStateLoaded(List<TaskEntity> tasks) : super(tasks: tasks);
}

class TasksHandlerFailed extends TasksHandlerState {
  const TasksHandlerFailed(List<TaskEntity> tasks) : super(tasks: tasks);
  @override
  List<Object> get props => [tasks];
}
