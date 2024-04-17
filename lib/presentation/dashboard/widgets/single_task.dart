import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:gap/gap.dart';
import 'package:task_app/core/l10n/l10n.dart';
import 'package:task_app/core/params/task_params.dart';
import 'package:task_app/core/themes/colors.dart';
import 'package:task_app/core/themes/text_style.dart';
import 'package:task_app/core/utils/extensions.dart';
import 'package:task_app/domain/entity/task_entity.dart';
import 'package:task_app/domain/subentity/task_status.dart';
import 'package:task_app/presentation/dashboard/business/cubit/tasks_handler/tasks_handler_cubit.dart';

class SingleTask extends StatelessWidget {
  const SingleTask({
    required this.task,
    super.key,
  });

  final TaskEntity task;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return BlocBuilder<TasksHandlerCubit, TasksHandlerState>(
      builder: (context, state) {
        return Slidable(
          endActionPane: ActionPane(motion: const StretchMotion(), children: [
            SlidableAction(
              onPressed: (context) {
                context
                    .read<TasksHandlerCubit>()
                    .deleteTask(DeleteTaskParams(id: task.id));
                print(task.id);
              },
              label: l10n.delete,
              icon: Icons.delete,
              backgroundColor: Colors.red,
            )
          ]),
          startActionPane: ActionPane(motion: const StretchMotion(), children: [
            SlidableAction(
              onPressed: (context) {},
              label: l10n.edit,
              icon: Icons.edit,
              backgroundColor: Colors.green,
            )
          ]),
          child: Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: checkStatus(task.status),
            ),
            margin: const EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      task.title,
                      style: AppTextStyles.descriptionMid,
                    ),
                    Text(
                      task.status.name.toUpperCase(),
                      style: AppTextStyles.descriptionMid,
                    )
                  ],
                ),
                const Divider(),
                const Gap(10),
                Text(
                  task.description,
                  style: AppTextStyles.descriptionSmall,
                ),
                const Gap(10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "${l10n.deadline} ${task.deadline.toString().cut(16)}",
                      style: AppTextStyles.descriptionSmall,
                    ),
                    Text(
                      task.owner,
                      style: AppTextStyles.descriptionMid,
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

Color checkStatus(TaskStatus status) {
  switch (status) {
    case TaskStatus.planned:
      return Colors.red.withOpacity(0.3);
    case TaskStatus.executing:
      return AppColors.lightBackground;
    case TaskStatus.done:
      return Colors.green.withOpacity(0.5);
  }
}
