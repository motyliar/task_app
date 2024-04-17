import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_app/core/constans/export.dart';
import 'package:task_app/core/l10n/l10n.dart';
import 'package:task_app/core/router/route_animation.dart';
import 'package:task_app/core/themes/colors.dart';
import 'package:task_app/presentation/app/business/cubit/get_tasks_cubit.dart';
import 'package:task_app/presentation/dashboard/business/switch_button.dart';
import 'package:task_app/presentation/dashboard/widgets/add_task_bottom_sheet.dart';
import 'package:task_app/presentation/dashboard/widgets/custom_sliver_appbar.dart';
import 'package:task_app/presentation/dashboard/widgets/main_label_text.dart';
import 'package:task_app/presentation/dashboard/widgets/single_task.dart';

const double _emptySpaceToEndPage = 100;
TextEditingController _titleController = TextEditingController();
TextEditingController _descriptionController = TextEditingController();
TextEditingController _ownerController = TextEditingController();

class Dashboard extends StatelessWidget {
  const Dashboard({super.key});

  static Route route() {
    return RouteAnimations.slidingDownRoute(
        child: const Dashboard(), route: kDashBoardPage);
  }

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return BlocProvider(
      create: (context) => SwitchButtonCubit(),
      child: Scaffold(
        backgroundColor: AppColors.scaffoldBackground,
        body: SafeArea(
          child: CustomScrollView(
            slivers: [
              CustomSliverAppBar(l10n: l10n),
              SliverToBoxAdapter(
                child: Align(
                  alignment: Alignment.center,
                  child: MainLabelText(
                    l10n: l10n,
                    text: l10n.allTasksLabel,
                  ),
                ),
              ),
              SliverToBoxAdapter(
                child: BlocBuilder<GetTasksCubit, GetTasksState>(
                  builder: (context, state) {
                    return Column(
                      children: List.generate(
                          state.tasks.length,
                          (index) => SingleTask(
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
            AddTaskBottomSheet(context, _titleController,
                _descriptionController, _ownerController);
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
