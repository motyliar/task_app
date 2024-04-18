import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:task_app/core/params/task_params.dart';
import 'package:task_app/domain/entity/task_entity.dart';
import 'package:task_app/domain/usecases/add_task_usecase.dart';
import 'package:task_app/domain/usecases/delete_task_usecase.dart';
import 'package:task_app/domain/usecases/update_task_usecase.dart';

part 'tasks_handler_state.dart';

class TasksHandlerCubit extends Cubit<TasksHandlerState> {
  final AddTaskUseCase _addTask;
  final DeleteTaskUseCase _deleteTask;
  final UpdateTaskUsecase _updateTask;
  TasksHandlerCubit(
      {required AddTaskUseCase addTask,
      required DeleteTaskUseCase deleteTask,
      required UpdateTaskUsecase updateTask})
      : _addTask = addTask,
        _deleteTask = deleteTask,
        _updateTask = updateTask,
        super(const TasksHandlerStateLoading(<TaskEntity>[]));

  Future<void> addTask(TaskParams params) async {
    return _handlingAddResponse(params);
  }

  Future<void> deleteTask(DeleteTaskParams params) async {
    return _handlingDeleteResponse(params);
  }

  Future<void> updateTask(UpdateTaskParams params) async {
    return _handlingUpdateResponse(params);
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

  Future<void> _handlingUpdateResponse(UpdateTaskParams params) async {
    try {
      _requestingToUpdate(params);
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

  Future<void> _requestingToUpdate(UpdateTaskParams params) async {
    return await _updateTask
        .execute(params)
        .then((resposne) => resposne.fold((l) => throw l, (r) => r));
  }
}
