import 'package:get_it/get_it.dart';
import 'package:task_app/data/repository/task_repository_impl.dart';
import 'package:task_app/data/sources/local/task_local_source.dart';
import 'package:task_app/domain/repository/task_repository.dart';
import 'package:task_app/domain/usecases/add_task_usecase.dart';
import 'package:task_app/domain/usecases/delete_task_usecase.dart';
import 'package:task_app/domain/usecases/get_task_usecase.dart';
import 'package:task_app/domain/usecases/update_task_usecase.dart';
import 'package:task_app/presentation/app/business/cubit/get_tasks_cubit.dart';
import 'package:task_app/presentation/dashboard/business/cubit/tasks_handler/tasks_handler_cubit.dart';

final taskLocator = GetIt.instance;

void taskInit() {
  //factory
  taskLocator
    ..registerFactory(() => GetTasksCubit(getTask: taskLocator()))
    ..registerFactory(() => TasksHandlerCubit(
        addTask: taskLocator(),
        deleteTask: taskLocator(),
        updateTask: taskLocator()))

    //usecases
    ..registerLazySingleton(() => GetTaskUsecase(repository: taskLocator()))
    ..registerLazySingleton(() => AddTaskUseCase(repository: taskLocator()))
    ..registerLazySingleton(() => DeleteTaskUseCase(repository: taskLocator()))
    ..registerLazySingleton(() => UpdateTaskUsecase(repository: taskLocator()))

    //sources

    ..registerLazySingleton<TaskLocalDataSource>(
        () => TaskLocalDataSourceImpl())

    //repository
    ..registerLazySingleton<TaskRepository>(
        () => TaskRepositoryImpl(local: taskLocator()));
}
