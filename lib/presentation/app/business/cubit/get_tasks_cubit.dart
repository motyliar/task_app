import 'package:bloc/bloc.dart';
import 'package:task_app/domain/entity/task_entity.dart';
import 'package:task_app/domain/usecases/get_task_usecase.dart';

part 'get_tasks_state.dart';

class GetTasksCubit extends Cubit<GetTasksState> {
  final GetTaskUsecase _getTask;
  GetTasksCubit({required GetTaskUsecase getTask})
      : _getTask = getTask,
        super(GetTaskStateLoading(const <TaskEntity>[]));

  Future<void> fetchTasks() {
    return _handleResponse();
  }

  Future<void> _handleResponse() async {
    emit(GetTaskStateLoading(state.tasks));
    try {
      final response = await _getResponse();
      emit(GetTasksState(tasks: response));
    } catch (e) {
      emit(GetTasksFailed(state.tasks));
    }
  }

  Future<List<TaskEntity>> _getResponse() async {
    return await _getTask
        .execute()
        .then((response) => response.fold((l) => throw l, (r) => r));
  }
}
