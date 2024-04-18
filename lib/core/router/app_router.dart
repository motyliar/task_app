import 'package:flutter/material.dart';

import 'package:task_app/core/constans/export.dart';
import 'package:task_app/domain/entity/task_entity.dart';

import 'package:task_app/presentation/dashboard/dashboard.dart';
import 'package:task_app/presentation/dashboard/widgets/single_task.dart';
import 'package:task_app/presentation/error/view/error_page.dart';
import 'package:task_app/presentation/single_task/view/single_task.dart';

class AppRouter {
  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case kDashBoardPage:
        return Dashboard.route();
      case kSingleTask:
        return SingleTaskPage.route(settings.arguments as TaskEntity);
      default:
        return ErrorPage.route();
    }
  }
}
