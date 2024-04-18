import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:task_app/core/params/task_params.dart';
import 'package:task_app/domain/entity/task_entity.dart';
import 'package:task_app/domain/subentity/task_status.dart';
import 'package:task_app/domain/usecases/add_task_usecase.dart';
import 'package:task_app/domain/usecases/delete_task_usecase.dart';
import 'package:task_app/domain/usecases/get_task_usecase.dart';
import 'package:task_app/domain/usecases/update_task_usecase.dart';

part 'tasks_handler_state.dart';

class TasksHandlerCubit extends Cubit<TasksHandlerState> {
  final GetTaskUsecase _getTask;
  final AddTaskUseCase _addTask;
  final DeleteTaskUseCase _deleteTask;
  final UpdateTaskUsecase _updateTask;
  TasksHandlerCubit(
      {required GetTaskUsecase getTask,
      required AddTaskUseCase addTask,
      required DeleteTaskUseCase deleteTask,
      required UpdateTaskUsecase updateTask})
      : _getTask = getTask,
        _addTask = addTask,
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

  Future<void> fetchTasks() {
    return _handleResponse();
  }

  Future<void> _handlingAddResponse(TaskParams params) async {
    emit(TasksHandlerStateLoading(state.tasks));
    print(state);
    try {
      await _requestingToAdd(params);
      await fetchTasks();
      debugPrint(state.toString());
    } catch (e) {
      emit(TasksHandlerFailed(state.tasks));
    }
  }

  Future<void> _handlingDeleteResponse(DeleteTaskParams params) async {
    emit(TasksHandlerStateLoading(state.tasks));
    try {
      await _requestingToDelete(params);
      await fetchTasks();
      debugPrint(state.toString());
    } catch (e) {
      emit(TasksHandlerFailed(state.tasks));
    }
  }

  Future<void> _handlingUpdateResponse(UpdateTaskParams params) async {
    emit(TasksHandlerStateLoading(state.tasks));
    try {
      await _requestingToUpdate(params);
      await fetchTasks();
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

  Future<void> _handleResponse() async {
    emit(TasksHandlerStateLoading(state.tasks));
    try {
      final response = await _getResponse();
      emit(TaskHandlerStateLoaded(response));
    } catch (e) {
      emit(TasksHandlerFailed(state.tasks));
    }
  }

  Future<List<TaskEntity>> _getResponse() async {
    return await _getTask
        .execute()
        .then((response) => response.fold((l) => throw l, (r) => r));
  }

  Future<void> sortByName(String name) async {
    emit(TasksHandlerStateLoading(state.tasks));
    var searchQuery = name.toLowerCase();
    try {
      if (name.isEmpty) {
        await fetchTasks();
      } else {
        var tasks = state.tasks;
        var sorted = tasks
            .where(
                (element) => element.owner.toLowerCase().contains(searchQuery))
            .toList();
        emit(TaskHandlerStateLoaded(sorted));
      }
    } catch (e) {
      emit(TasksHandlerFailed(state.tasks));
    }
  }

  void sortByStatus(TaskStatus status) {
    emit(TasksHandlerStateLoading(state.tasks));

    try {
      var tasks = state.tasks;
      var sorted = tasks.where((element) => element.status == status).toList();

      emit(TasksHandlerState(tasks: sorted));
    } catch (e) {
      emit(TasksHandlerFailed(state.tasks));
    }
  }
}
