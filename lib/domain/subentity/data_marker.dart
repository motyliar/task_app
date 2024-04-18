// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:task_app/data/models/submodels/data_marker.dart';
import 'package:task_app/data/models/submodels/data_stat_m.dart';

class DateMarker {
  DateMarker({this.day = 0, this.month = 0, this.year = 0});
  int day;
  int month;
  int year;

  void setData() {
    day = DateTime.now().day;
    month = DateTime.now().month;
    year = DateTime.now().year;
  }

  static DateMarker currentDay() => DateMarker(
      day: DateTime.now().day,
      month: DateTime.now().month,
      year: DateTime.now().year);

  DataMarkerModel setToModel() => DataMarkerModel(
      day: DateTime.now().day,
      month: DateTime.now().month,
      year: DateTime.now().year);

  DataMarkerModel toModel() =>
      DataMarkerModel(day: day, month: month, year: year);
}

class DateStat {
  final DateMarker create;
  final DateMarker execution;
  final DateMarker done;
  const DateStat({
    required this.create,
    required this.execution,
    required this.done,
  });

  DataStatM toModel(String status) => DataStatM(
      create: create.toModel(),
      execution:
          status == "executing" ? execution.setToModel() : execution.toModel(),
      done: status == "done" ? done.setToModel() : done.toModel());
}
