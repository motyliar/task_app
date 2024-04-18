import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:task_app/core/constans/export.dart';
import 'package:task_app/core/l10n/l10n.dart';
import 'package:task_app/core/router/route_animation.dart';

import 'package:task_app/core/themes/colors.dart';
import 'package:task_app/core/themes/text_style.dart';

import 'package:task_app/domain/subentity/task_status.dart';
import 'package:task_app/presentation/app/view/widgets/loader.dart';
import 'package:task_app/presentation/dashboard/business/cubit/get_weather_cubit.dart';
import 'package:task_app/presentation/dashboard/business/cubit/tasks_handler/tasks_handler_cubit.dart';
import 'package:task_app/presentation/dashboard/business/switch_button.dart';
import 'package:task_app/presentation/dashboard/widgets/task_bottom_sheet.dart';
import 'package:task_app/presentation/dashboard/widgets/custom_sliver_appbar.dart';
import 'package:task_app/presentation/dashboard/widgets/main_label_text.dart';
import 'package:task_app/presentation/dashboard/widgets/single_task.dart';

const double _emptySpaceToEndPage = 100;
TextEditingController _titleController = TextEditingController();
TextEditingController _descriptionController = TextEditingController();
TextEditingController _ownerController = TextEditingController();
TextEditingController _searchController = TextEditingController();

class Dashboard extends StatelessWidget {
  const Dashboard({super.key});

  static Route route() {
    return RouteAnimations.slidingDownRoute(
        child: const Dashboard(), route: kDashBoardPage);
  }

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => SwitchButtonCubit(),
        ),
      ],
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        backgroundColor: AppColors.scaffoldBackground,
        body: SafeArea(
          child: CustomScrollView(
            slivers: [
              CustomSliverAppBar(l10n: l10n),
              SliverToBoxAdapter(
                child: BlocBuilder<GetWeatherCubit, String>(
                  builder: (context, state) {
                    debugPrint(state);
                    return Align(
                      alignment: Alignment.center,
                      child: Container(
                          padding: const EdgeInsets.all(5),
                          width: 150,
                          decoration: BoxDecoration(
                            color: AppColors.doneColor,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Center(
                            child: Column(
                              children: [
                                const Text("Actual temp"),
                                Text(state),
                              ],
                            ),
                          )),
                    );
                  },
                ),
              ),
              SliverToBoxAdapter(
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      MainLabelText(
                        l10n: l10n,
                        text: l10n.allTasksLabel,
                      ),
                      ElevatedButton(
                          onPressed: () =>
                              context.read<TasksHandlerCubit>().fetchTasks(),
                          child: Text(
                            l10n.all,
                            style: AppTextStyles.descriptionMid,
                          )),
                      ElevatedButton(
                          onPressed: () => showModalBottomSheet(
                                context: context,
                                builder: (context) => Padding(
                                  padding: EdgeInsets.only(
                                    bottom: MediaQuery.of(context)
                                        .viewInsets
                                        .bottom,
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.all(20.0),
                                    child: Row(
                                      children: [
                                        ElevatedButton(
                                          onPressed: () {
                                            context
                                                .read<TasksHandlerCubit>()
                                                .sortByStatus(
                                                    TaskStatus.planned);
                                            Navigator.pop(context);
                                          },
                                          child: Text(
                                            l10n.planned,
                                            style: AppTextStyles.descriptionMid,
                                          ),
                                        ),
                                        ElevatedButton(
                                          onPressed: () {
                                            context
                                                .read<TasksHandlerCubit>()
                                                .sortByStatus(
                                                    TaskStatus.executing);
                                            Navigator.pop(context);
                                          },
                                          child: Text(
                                            l10n.executing,
                                            style: AppTextStyles.descriptionMid,
                                          ),
                                        ),
                                        ElevatedButton(
                                          onPressed: () {
                                            context
                                                .read<TasksHandlerCubit>()
                                                .sortByStatus(TaskStatus.done);
                                            Navigator.pop(context);
                                          },
                                          child: Text(
                                            l10n.done,
                                            style: AppTextStyles.descriptionMid,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                          child: Text(
                            l10n.status,
                            style: AppTextStyles.descriptionMid,
                          )),
                      ElevatedButton(
                          onPressed: () => showModalBottomSheet(
                                context: context,
                                builder: (context) => Padding(
                                  padding: EdgeInsets.only(
                                      bottom: MediaQuery.of(context)
                                          .viewInsets
                                          .bottom),
                                  child: Container(
                                    width: MediaQuery.of(context).size.width,
                                    height: 50,
                                    margin: const EdgeInsets.all(10),
                                    child: Row(
                                      children: [
                                        Text(l10n.search,
                                            style:
                                                AppTextStyles.descriptionSmall),
                                        const Gap(10),
                                        SizedBox(
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.5,
                                          height: 50,
                                          child: TextFormField(
                                            controller: _searchController,
                                            onChanged: (value) => context
                                                .read<TasksHandlerCubit>()
                                                .sortByName(
                                                    _searchController.text),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                          child: Text(
                            l10n.owner,
                            style: AppTextStyles.descriptionMid,
                          )),
                    ]),
              ),
              SliverToBoxAdapter(
                child: BlocBuilder<TasksHandlerCubit, TasksHandlerState>(
                  builder: (context, state) {
                    if (state is TasksHandlerStateLoading) {
                      return const Center(child: LoaderPage());
                    }

                    return Column(
                      children: List.generate(
                          state.tasks.length,
                          (index) => SingleTask(
                                onTap: () => Navigator.pushNamed(
                                    context, kSingleTask,
                                    arguments: state.tasks[index]),
                                task: state.tasks[index],
                              )),
                    );
                  },
                ),
              ),
              const SliverToBoxAdapter(
                child: SizedBox(
                  height: _emptySpaceToEndPage,
                ),
              ),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          foregroundColor: AppColors.accent,
          backgroundColor: AppColors.accent,
          onPressed: () {
            taskBottomSheet(
              buttonText: l10n.buttonAdd,
              context,
              _titleController,
              _descriptionController,
              _ownerController,
            );
          },
          child: const Icon(
            Icons.add,
            color: AppColors.lightBackground,
          ),
        ),
      ),
    );
  }
}
