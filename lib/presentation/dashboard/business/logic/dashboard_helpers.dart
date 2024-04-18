import 'package:flutter/material.dart';
import 'package:task_app/core/l10n/l10n.dart';
import 'package:task_app/core/themes/colors.dart';
import 'package:task_app/data/models/submodels/data_stat_m.dart';
import 'package:task_app/data/models/task_model.dart';
import 'package:task_app/domain/entity/task_entity.dart';
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

  static setInitialControllerText(
      TextEditingController text,
      TextEditingController description,
      TextEditingController owner,
      TaskEntity? task) {
    if (task != null) {
      text.text = task.title;
      description.text = task.description;
      owner.text = task.owner;
    }
  }

  static TaskModel convertUpdatedTaskToModel(
      {required String title,
      required String description,
      required String owner,
      required DateTime deadline,
      required String status,
      required DataStatM stat,
      required bool isPriority,
      required String id}) {
    return TaskModel(
        title: title,
        description: description,
        deadline: deadline,
        owner: owner,
        status: status,
        stat: stat,
        isPriroity: isPriority,
        id: id);
  }

  static clearControllersWithPop(
      TextEditingController titleController,
      TextEditingController descriptionController,
      TextEditingController ownerController,
      BuildContext context) {
    titleController.clear();
    descriptionController.clear();
    ownerController.clear();
    Navigator.of(context).pop();
  }
}
