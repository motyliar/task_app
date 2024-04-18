import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:task_app/domain/entity/task_entity.dart';
import 'package:task_app/domain/subentity/task_status.dart';

part 'chart_stat_state.dart';

class ChartStatCubit extends Cubit<ChartStatState> {
  ChartStatCubit() : super(const ChartStatState());

  void checkGeneralStatistic(List<TaskEntity> tasks) {
    var done = 0;
    var executing = 0;
    var planned = 0;
    for (var task in tasks) {
      if (task.status == TaskStatus.done) {
        done++;
      }
      if (task.status == TaskStatus.executing) {
        executing++;
      }
      if (task.status == TaskStatus.planned) {
        planned++;
      }
    }
    emit(ChartStatState(statistic: [planned, executing, done]));
  }

  void checkDailyStatistics(List<TaskEntity> tasks) {
    var done = 0;
    var executing = 0;
    var planned = 0;
    var date = DateTime.now();
    for (var task in tasks) {
      if (task.stat.create.day == date.day &&
          task.stat.create.month == date.month &&
          task.stat.create.year == date.year) {
        planned++;
      }
      if (task.stat.execution.day == date.day &&
          task.stat.execution.month == date.month &&
          task.stat.execution.year == date.year) {
        executing++;
      }
      if (task.stat.done.day == date.day &&
          task.stat.done.month == date.month &&
          task.stat.done.year == date.year) {
        done++;
      }
      emit(ChartStatState(statistic: [planned, executing, done]));
    }
  }

  void checkMonthlyStatistics(
    List<TaskEntity> tasks,
  ) {
    var done = 0;
    var executing = 0;
    var planned = 0;
    var date = DateTime.now();
    for (var task in tasks) {
      if (task.stat.create.month == date.month &&
          task.stat.create.year == date.year) {
        planned++;
      }
      if (task.stat.execution.month == date.month &&
          task.stat.execution.year == date.year) {
        executing++;
      }
      if (task.stat.done.month == date.month &&
          task.stat.done.year == date.year) {
        done++;
      }
      emit(ChartStatState(statistic: [planned, executing, done]));
    }
  }
}
