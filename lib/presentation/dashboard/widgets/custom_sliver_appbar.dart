import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:task_app/core/constans/export.dart';
import 'package:task_app/core/l10n/l10n.dart';
import 'package:task_app/core/themes/colors.dart';
import 'package:task_app/core/themes/text_style.dart';
import 'package:task_app/core/utils/extensions.dart';
import 'package:task_app/presentation/app/business/cubit/localization_switch_cubit.dart';
import 'package:task_app/presentation/dashboard/business/cubit/tasks_handler/tasks_handler_cubit.dart';

const double spaceBetweenIconsInRow = 20;

class CustomSliverAppBar extends StatelessWidget {
  const CustomSliverAppBar(
      {super.key,
      required this.l10n,
      this.appBarMargin = 10,
      this.height = 150});
  final double appBarMargin;
  final AppLocalizations l10n;
  final double height;

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      backgroundColor: AppColors.scaffoldBackground,
      automaticallyImplyLeading: false,
      floating: true,
      expandedHeight: height,
      flexibleSpace: FlexibleSpaceBar(
        background: Container(
            height: height,
            margin: EdgeInsets.all(appBarMargin),
            decoration: const BoxDecoration(
              border: Border(
                  bottom: BorderSide(color: AppColors.accent, width: 3),
                  left: BorderSide(color: AppColors.accent, width: 3),
                  right: BorderSide(color: AppColors.accent, width: 3)),
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(20),
                bottomRight: Radius.circular(20),
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(l10n.appTitle, style: AppTextStyles.headersMedium),
                const Gap(20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    BlocBuilder<TasksHandlerCubit, TasksHandlerState>(
                      builder: (context, state) {
                        return GestureDetector(
                          onTap: () => Navigator.pushNamed(
                              context, kStatisticPage,
                              arguments: state.tasks),
                          child: const Icon(Icons.bar_chart),
                        );
                      },
                    ),
                    const Gap(spaceBetweenIconsInRow),
                    BlocBuilder<TasksHandlerCubit, TasksHandlerState>(
                      builder: (context, state) {
                        var deadlineList = state.tasks
                            .where(
                              (element) =>
                                  element.deadline.toString().cut(10) ==
                                  DateTime.now().toString().cut(10),
                            )
                            .toList();

                        return GestureDetector(
                          onTap: () => deadlineList.isNotEmpty
                              ? Navigator.pushNamed(
                                  context,
                                  kPriorityPage,
                                  arguments: deadlineList,
                                )
                              : null,
                          child: Badge(
                              label: Text(deadlineList.length.toString()),
                              child: Opacity(
                                  opacity: deadlineList.isNotEmpty ? 1.0 : 0.5,
                                  child: const Icon(Icons.notifications))),
                        );
                      },
                    ),
                    const Gap(spaceBetweenIconsInRow),
                    GestureDetector(
                        onTap: () =>
                            BlocProvider.of<LocalizationSwitchCubit>(context)
                                .changeLanguage(),
                        child: const Icon(Icons.translate)),
                    const Gap(10)
                  ],
                ),
              ],
            )),
      ),
    );
  }
}
