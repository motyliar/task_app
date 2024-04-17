import 'package:flutter_test/flutter_test.dart';
import 'package:task_app/domain/subentity/task_status.dart';

void main() {
  test("convertStatus, check is correct return", () {
    //given
    var testStatus = TaskStatus.planned;
    //when
    final response = convertStatus("planned");
    expect(testStatus, response);
  });

  test("convertStatus, check is planned when wrong input", () {
    //given
    var testStatus = TaskStatus.planned;
    //when
    final response = convertStatus("wrong");
    expect(testStatus, response);
  });
}
