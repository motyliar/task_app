import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:gap/gap.dart';
import 'package:task_app/core/l10n/l10n.dart';
import 'package:task_app/core/params/task_params.dart';
import 'package:task_app/core/themes/text_style.dart';
import 'package:task_app/core/utils/extensions.dart';
import 'package:task_app/domain/entity/task_entity.dart';

import 'package:task_app/presentation/dashboard/business/cubit/tasks_handler/tasks_handler_cubit.dart';
import 'package:task_app/presentation/dashboard/business/logic/dashboard_helpers.dart';
import 'package:task_app/presentation/dashboard/widgets/task_bottom_sheet.dart';

const int _lenghtOfData = 16;
TextEditingController _titleController = TextEditingController();
TextEditingController _descriptionController = TextEditingController();
TextEditingController _ownerController = TextEditingController();

class SingleTask extends StatelessWidget {
  const SingleTask({
    required this.task,
    required this.onTap,
    super.key,
  });

  final TaskEntity task;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return BlocBuilder<TasksHandlerCubit, TasksHandlerState>(
      builder: (context, state) {
        return GestureDetector(
          onTap: () => onTap(),
          child: Slidable(
            endActionPane: ActionPane(motion: const StretchMotion(), children: [
              SlidableAction(
                onPressed: (context) {
                  context
                      .read<TasksHandlerCubit>()
                      .deleteTask(DeleteTaskParams(id: task.id));
                },
                label: l10n.delete,
                icon: Icons.delete,
                backgroundColor: Colors.red,
              )
            ]),
            startActionPane:
                ActionPane(motion: const StretchMotion(), children: [
              SlidableAction(
                onPressed: (context) => taskBottomSheet(
                    buttonText: l10n.buttonEdit,
                    context,
                    _titleController,
                    _descriptionController,
                    _ownerController,
                    task: task,
                    isAdd: true),
                label: l10n.edit,
                icon: Icons.edit,
                backgroundColor: Colors.green,
              )
            ]),
            child: Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: DashboardHelpers.checkStatus(task.status),
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
                        style: AppTextStyles.descriptionBig
                            .copyWith(fontWeight: FontWeight.bold),
                      ),
                      Row(
                        children: [
                          Visibility(
                            visible: task.isPriority,
                            child: const CircleAvatar(
                              radius: 10,
                              backgroundColor: Colors.red,
                            ),
                          ),
                          const Gap(5),
                          Text(
                            DashboardHelpers.convertStatusToLocalizationName(
                                    task.status, context)
                                .toUpperCase(),
                            style: AppTextStyles.descriptionMid,
                          )
                        ],
                      ),
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
                      Column(
                        children: [
                          Text(
                            l10n.deadline,
                            style: AppTextStyles.descriptionSmall
                                .copyWith(fontWeight: FontWeight.bold),
                          ),
                          Text(task.deadline.toString().cut(_lenghtOfData),
                              style: AppTextStyles.descriptionSmall),
                        ],
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
          ),
        );
      },
    );
  }
}
