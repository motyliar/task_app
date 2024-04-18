import 'package:flutter/material.dart';
import 'package:task_app/core/constans/export.dart';
import 'package:task_app/core/l10n/l10n.dart';
import 'package:task_app/core/router/route_animation.dart';
import 'package:task_app/core/themes/colors.dart';
import 'package:task_app/core/themes/text_style.dart';
import 'package:task_app/domain/entity/task_entity.dart';
import 'package:task_app/presentation/dashboard/widgets/single_task.dart';

class PriorityPage extends StatelessWidget {
  const PriorityPage({required this.tasks, super.key});

  final List<TaskEntity> tasks;
  static Route route(List<TaskEntity> tasks) {
    return RouteAnimations.slidingDownRoute(
        child: PriorityPage(
          tasks: tasks,
        ),
        route: kPriorityPage);
  }

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return Scaffold(
      backgroundColor: AppColors.scaffoldBackground,
      appBar: AppBar(
        title: Text(
          l10n.deadline,
          style: AppTextStyles.descriptionBig,
        ),
      ),
      body: SingleChildScrollView(
          child: Column(
        children: List.generate(
            tasks.length,
            (index) => SingleTask(
                task: tasks[index],
                onTap: () => Navigator.pushNamed(context, kSingleTask,
                    arguments: tasks[index]))),
      )),
    );
  }
}
