import 'package:get_it/get_it.dart';
import 'package:task_app/data/repository/task_repository_impl.dart';
import 'package:task_app/data/repository/weather_repository_impl.dart';
import 'package:task_app/data/sources/local/task_local_source.dart';
import 'package:task_app/data/sources/remote/weather_remote_source.dart';
import 'package:task_app/domain/repository/task_repository.dart';
import 'package:task_app/domain/repository/weather_repository.dart';
import 'package:task_app/domain/usecases/add_task_usecase.dart';
import 'package:task_app/domain/usecases/delete_task_usecase.dart';
import 'package:task_app/domain/usecases/get_current_weather.dart';
import 'package:task_app/domain/usecases/get_task_usecase.dart';
import 'package:task_app/domain/usecases/update_task_usecase.dart';
import 'package:task_app/presentation/app/business/cubit/get_tasks_cubit.dart';
import 'package:task_app/presentation/dashboard/business/cubit/get_weather_cubit.dart';
import 'package:task_app/presentation/dashboard/business/cubit/tasks_handler/tasks_handler_cubit.dart';
import 'package:http/http.dart' as http;

final taskLocator = GetIt.instance;

void taskInit() {
  //factory
  taskLocator
    ..registerFactory(() => GetTasksCubit(getTask: taskLocator()))
    ..registerFactory(() => TasksHandlerCubit(
        getTask: taskLocator(),
        addTask: taskLocator(),
        deleteTask: taskLocator(),
        updateTask: taskLocator()))
    ..registerFactory(() => GetWeatherCubit(getWeather: taskLocator()))

    //usecases
    ..registerLazySingleton(() => GetTaskUsecase(repository: taskLocator()))
    ..registerLazySingleton(() => AddTaskUseCase(repository: taskLocator()))
    ..registerLazySingleton(() => DeleteTaskUseCase(repository: taskLocator()))
    ..registerLazySingleton(() => UpdateTaskUsecase(repository: taskLocator()))
    ..registerLazySingleton(
        () => GetCurrentWeatherUsecase(repository: taskLocator()))

    //sources

    ..registerLazySingleton<TaskLocalDataSource>(
        () => TaskLocalDataSourceImpl())
    ..registerLazySingleton<WeatherRemoteSource>(
        () => WeatherRemoteSourceImpl(client: taskLocator()))
    //repository
    ..registerLazySingleton<TaskRepository>(
        () => TaskRepositoryImpl(local: taskLocator()))
    ..registerLazySingleton<WeatherRepository>(
        () => WeatherRepositoryImpl(remote: taskLocator()))
    ..registerLazySingleton(() => http.Client());
}
