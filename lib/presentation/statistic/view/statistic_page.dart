import 'package:flutter/material.dart';
import 'package:task_app/core/constans/export.dart';
import 'package:task_app/core/router/route_animation.dart';
import 'package:task_app/domain/entity/task_entity.dart';

class StatisticPage extends StatelessWidget {
  const StatisticPage({required this.tasks, super.key});

  final List<TaskEntity> tasks;

  static Route route(List<TaskEntity> tasks) {
    return RouteAnimations.slidingDownRoute(
        child: StatisticPage(tasks: tasks), route: kStatisticPage);
  }

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
