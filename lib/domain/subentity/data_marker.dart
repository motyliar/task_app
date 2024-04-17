// ignore_for_file: public_member_api_docs, sort_constructors_first
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
}
