import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:task_app/core/constans/export.dart';
import 'package:task_app/core/l10n/l10n.dart';
import 'package:task_app/core/params/task_params.dart';
import 'package:task_app/core/router/route_animation.dart';
import 'package:task_app/core/themes/colors.dart';
import 'package:task_app/core/themes/text_style.dart';
import 'package:task_app/core/utils/extensions.dart';
import 'package:task_app/domain/entity/task_entity.dart';
import 'package:task_app/domain/helpers/usecase_status.dart';
import 'package:task_app/domain/subentity/task_status.dart';
import 'package:task_app/presentation/dashboard/business/cubit/tasks_handler/tasks_handler_cubit.dart';
import 'package:task_app/presentation/dashboard/business/logic/dashboard_helpers.dart';
import 'package:task_app/presentation/single_task/business/single_task_helpers.dart';

class SingleTaskPage extends StatelessWidget {
  const SingleTaskPage({required this.task, super.key});

  final TaskEntity task;

  static Route route(TaskEntity taskEntity) {
    return RouteAnimations.slidingDownRoute(
        child: SingleTaskPage(task: taskEntity), route: kSingleTask);
  }

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return Scaffold(
      backgroundColor: AppColors.scaffoldBackground,
      appBar: AppBar(
        backgroundColor: AppColors.scaffoldBackground,
        title: Text(
          l10n.singleTask,
          style: AppTextStyles.headersMedium,
        ),
      ),
      body: SafeArea(
          child: Container(
        margin: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Divider(),
            const Gap(5),
            Text("${l10n.deadline} ${task.deadline.toString().cut(10)}"),
            const Gap(20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  task.title,
                  style: AppTextStyles.headersMedium
                      .copyWith(fontWeight: FontWeight.bold),
                ),
                Text(DashboardHelpers.convertStatusToLocalizationName(
                    task.status, context)),
              ],
            ),
            const Gap(20),
            Text(
              task.description,
              style: AppTextStyles.descriptionMid,
            ),
            const Gap(5),
            Align(
                alignment: Alignment.bottomRight,
                child: Text(
                  task.owner.toUpperCase(),
                  style: AppTextStyles.descriptionMid,
                )),
            const Divider(),
            const Gap(10),
            Text(
              l10n.changeStatus,
              style: AppTextStyles.descriptionBig
                  .copyWith(fontWeight: FontWeight.bold),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                    onPressed: () => BlocProvider.of<TasksHandlerCubit>(context)
                        .updateTask(UpdateTaskParams(
                            id: task.id,
                            task: SingleTaskHelpers.covertToModelWithNewStatus(
                                task, TaskStatus.planned.name))),
                    child: Text(l10n.planned.toUpperCase())),
                ElevatedButton(
                    onPressed: () => BlocProvider.of<TasksHandlerCubit>(context)
                        .updateTask(UpdateTaskParams(
                            id: task.id,
                            task: SingleTaskHelpers.covertToModelWithNewStatus(
                                task, TaskStatus.executing.name))),
                    child: Text(l10n.executing.toUpperCase())),
                ElevatedButton(
                    onPressed: () => BlocProvider.of<TasksHandlerCubit>(context)
                        .updateTask(UpdateTaskParams(
                            id: task.id,
                            task: SingleTaskHelpers.covertToModelWithNewStatus(
                                task, TaskStatus.done.name))),
                    child: Text(l10n.done.toUpperCase()))
              ],
            )
          ],
        ),
      )),
    );
  }
}
