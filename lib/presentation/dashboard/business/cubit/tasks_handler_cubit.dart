import 'package:bloc/bloc.dart';
import 'package:task_app/core/params/task_params.dart';
import 'package:task_app/domain/entity/task_entity.dart';
import 'package:task_app/domain/usecases/add_task_usecase.dart';

part 'tasks_handler_state.dart';

class TasksHandlerCubit extends Cubit<TasksHandlerState> {
  final AddTaskUseCase _addTask;
  TasksHandlerCubit({required AddTaskUseCase addTask})
      : _addTask = addTask,
        super(TasksHandlerStateLoading(const <TaskEntity>[]));

  Future<void> handlingAddResponse(TaskParams params) async {
    try {
      _requestingToAdd(params);
      emit(TasksHandlerState(tasks: state.tasks));
    } catch (e) {
      emit(TasksHandlerFailed(state.tasks));
    }
  }

  Future<void> _requestingToAdd(TaskParams params) async {
    return await _addTask
        .execute(params)
        .then((resposne) => resposne.fold((l) => throw l, (r) => r));
  }
}
