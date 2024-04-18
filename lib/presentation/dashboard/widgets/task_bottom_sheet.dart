import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:task_app/core/params/task_params.dart';
import 'package:task_app/core/services/get_it/task_container.dart';
import 'package:task_app/core/utils/extensions.dart';
import 'package:task_app/domain/entity/task_entity.dart';
import 'package:task_app/presentation/dashboard/business/cubit/tasks_handler/tasks_handler_cubit.dart';
import 'package:task_app/presentation/dashboard/business/logic/dashboard_helpers.dart';
import 'package:task_app/presentation/dashboard/business/switch_button.dart';

Future<dynamic> taskBottomSheet(
  BuildContext context,
  TextEditingController titleController,
  TextEditingController descriptionController,
  TextEditingController ownerController, {
  TaskEntity? task,
  bool isAdd = false,
  required String buttonText,
}) {
  DashboardHelpers.setInitialControllerText(
      titleController, descriptionController, ownerController, task);
  return showModalBottomSheet(
      isScrollControlled: true,
      context: context,
      builder: (context) => Padding(
            padding: EdgeInsets.only(
                bottom: MediaQuery.of(context).viewInsets.bottom),
            child: MultiBlocProvider(
              providers: [
                BlocProvider(
                  create: (context) => SwitchButtonCubit(),
                ),
                BlocProvider(
                  create: (context) => taskLocator<TasksHandlerCubit>(),
                ),
              ],
              child: Form(
                  child: Padding(
                padding: const EdgeInsets.only(left: 30, right: 10, top: 20),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    TextFormField(
                      controller: titleController,
                      maxLength: 50,
                      decoration: const InputDecoration(hintText: 'title'),
                    ),
                    TextFormField(
                      controller: descriptionController,
                      maxLength: 500,
                      minLines: 4,
                      maxLines: 10,
                      decoration:
                          const InputDecoration(hintText: 'description'),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                          width: MediaQuery.of(context).size.width * 0.5,
                          child: TextFormField(
                            controller: ownerController,
                            maxLength: 20,
                            decoration:
                                const InputDecoration(hintText: 'owner'),
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            const Text("Is priority?"),
                            const Gap(5),
                            BlocBuilder<SwitchButtonCubit, SwitchButtonState>(
                              builder: (context, state) {
                                return GestureDetector(
                                  onTap: () {
                                    context
                                        .read<SwitchButtonCubit>()
                                        .changePriority();
                                  },
                                  child: _CheckBox(
                                    visible: state.isPriority,
                                  ),
                                );
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                    const Gap(10),
                    Align(
                      alignment: Alignment.bottomRight,
                      child: BlocBuilder<SwitchButtonCubit, SwitchButtonState>(
                        builder: (context, state) {
                          return TextButton(
                              onPressed: () async {
                                await DashboardHelpers.pickDeadlineDate(context)
                                    .then((response) => context
                                        .read<SwitchButtonCubit>()
                                        .changeDeadline(response!));
                              },
                              child: Text(state.deadline.toString().cut(10)));
                        },
                      ),
                    ),
                    BlocBuilder<TasksHandlerCubit, TasksHandlerState>(
                      builder: (context, state) {
                        return BlocBuilder<SwitchButtonCubit,
                            SwitchButtonState>(
                          builder: (context, switchState) {
                            return ElevatedButton(
                                onPressed: () => isAdd
                                    ? context
                                        .read<TasksHandlerCubit>()
                                        .updateTask(UpdateTaskParams(
                                            id: task!.id,
                                            task: DashboardHelpers
                                                .convertUpdatedTaskToModel(
                                                    title: titleController.text,
                                                    description:
                                                        descriptionController
                                                            .text,
                                                    owner: ownerController.text,
                                                    deadline:
                                                        switchState.deadline,
                                                    status: task.status.name,
                                                    stat: task.stat
                                                        .toModel("none"),
                                                    isPriority:
                                                        switchState.isPriority,
                                                    id: task.id)))
                                    : context
                                        .read<TasksHandlerCubit>()
                                        .addTask(TaskParams(
                                            title: titleController.text,
                                            description:
                                                descriptionController.text,
                                            isPriority: switchState.isPriority,
                                            deadline: switchState.deadline,
                                            owner: ownerController.text))
                                        .then((response) {
                                        descriptionController.clear();
                                        ownerController.clear();
                                        titleController.clear();
                                        Navigator.pop(context);
                                      }),
                                child: Text(buttonText));
                          },
                        );
                      },
                    ),
                  ],
                ),
              )),
            ),
          ));
}

class _CheckBox extends StatelessWidget {
  const _CheckBox({super.key, required this.visible});

  final bool visible;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 22,
      height: 22,
      color: Colors.grey.withOpacity(0.5),
      child: visible
          ? Container(
              margin: const EdgeInsets.all(6),
              decoration: BoxDecoration(
                  color: Colors.red, borderRadius: BorderRadius.circular(50)),
            )
          : const SizedBox(),
    );
  }
}
