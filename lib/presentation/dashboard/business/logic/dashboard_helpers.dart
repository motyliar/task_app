import 'package:flutter/material.dart';
import 'package:task_app/core/l10n/l10n.dart';
import 'package:task_app/core/themes/colors.dart';
import 'package:task_app/domain/subentity/task_status.dart';

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

  static Color checkStatus(TaskStatus status) {
    switch (status) {
      case TaskStatus.planned:
        return Colors.red.withOpacity(0.3);
      case TaskStatus.executing:
        return AppColors.lightBackground;
      case TaskStatus.done:
        return Colors.green.withOpacity(0.5);
    }
  }

  static String convertStatusToLocalizationName(
      TaskStatus status, BuildContext context) {
    final l10n = context.l10n;
    switch (status) {
      case TaskStatus.planned:
        return l10n.planned;
      case TaskStatus.executing:
        return l10n.executing;
      case TaskStatus.done:
        return l10n.done;
    }
  }
}
