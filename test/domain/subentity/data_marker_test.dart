import 'package:flutter_test/flutter_test.dart';
import 'package:task_app/domain/subentity/data_marker.dart';

void main() {
  test("setData() ,should set correct day", () {
    //given
    int currentDay = DateTime.now().day;
    DateMarker today = DateMarker();
    //when
    today.setData();
    int day = today.day;

    expect(currentDay, day);
  });

  test("init, should be zero initial value", () {
    //given
    var today = DateMarker();

    expect(0, today.day);
    expect(0, today.month);
    expect(0, today.year);
  });
}
