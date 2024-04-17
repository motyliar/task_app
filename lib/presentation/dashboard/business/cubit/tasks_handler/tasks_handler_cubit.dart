import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:task_app/core/params/task_params.dart';
import 'package:task_app/domain/entity/task_entity.dart';
import 'package:task_app/domain/usecases/add_task_usecase.dart';
import 'package:task_app/domain/usecases/delete_task_usecase.dart';

part 'tasks_handler_state.dart';

class TasksHandlerCubit extends Cubit<TasksHandlerState> {
  final AddTaskUseCase _addTask;
  final DeleteTaskUseCase _deleteTask;
  TasksHandlerCubit(
      {required AddTaskUseCase addTask, required DeleteTaskUseCase deleteTask})
      : _addTask = addTask,
        _deleteTask = deleteTask,
        super(TasksHandlerStateLoading(const <TaskEntity>[]));

  Future<void> addTask(TaskParams params) async {
    return _handlingAddResponse(params);
  }

  Future<void> deleteTask(DeleteTaskParams params) async {
    return _handlingDeleteResponse(params);
  }

  Future<void> _handlingAddResponse(TaskParams params) async {
    try {
      _requestingToAdd(params);
      emit(TasksHandlerState(tasks: state.tasks));
      debugPrint(state.toString());
    } catch (e) {
      emit(TasksHandlerFailed(state.tasks));
    }
  }

  Future<void> _handlingDeleteResponse(DeleteTaskParams params) async {
    try {
      _requestingToDelete(params);
      emit(TasksHandlerState(tasks: state.tasks));
      debugPrint(state.toString());
    } catch (e) {
      emit(TasksHandlerFailed(state.tasks));
    }
  }

  Future<void> _requestingToAdd(TaskParams params) async {
    return await _addTask
        .execute(params)
        .then((resposne) => resposne.fold((l) => throw l, (r) => r));
  }

  Future<void> _requestingToDelete(DeleteTaskParams params) async {
    return await _deleteTask
        .execute(params)
        .then((resposne) => resposne.fold((l) => throw l, (r) => r));
  }
}
