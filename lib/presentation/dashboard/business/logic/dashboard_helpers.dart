import 'package:flutter/material.dart';

class DashboardHelpers {
  static Future<DateTime?> pickDeadlineDate(BuildContext context) async {
    DateTime? date = DateTime.now();
    await showDatePicker(
            context: context,
            initialDate: DateTime.now(),
            firstDate: DateTime.now(),
            lastDate: DateTime(2026))
        .then((value) => date = value);
    return date;
  }
}
