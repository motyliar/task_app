import 'package:flutter/material.dart';

import 'package:task_app/core/constans/export.dart';

import 'package:task_app/presentation/dashboard/dashboard.dart';
import 'package:task_app/presentation/error/view/error_page.dart';

class AppRouter {
  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case kDashBoardPage:
        return Dashboard.route();
      default:
        return ErrorPage.route();
    }
  }
}
