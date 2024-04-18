import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:task_app/core/constans/export.dart';
import 'package:task_app/core/l10n/l10n.dart';
import 'package:task_app/core/router/route_animation.dart';
import 'package:task_app/core/themes/colors.dart';
import 'package:task_app/core/themes/text_style.dart';

import 'package:task_app/domain/entity/task_entity.dart';

import 'package:task_app/presentation/dashboard/widgets/action_button.dart';
import 'package:task_app/presentation/statistic/business/cubit/chart_stat_cubit.dart';

const double _spaceBetweenMenuPieChart = 40;

class StatisticPage extends StatelessWidget {
  const StatisticPage({required this.tasks, super.key});

  final List<TaskEntity> tasks;

  static Route route(List<TaskEntity> tasks) {
    return RouteAnimations.slidingDownRoute(
        child: StatisticPage(tasks: tasks), route: kStatisticPage);
  }

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return BlocProvider(
      create: (context) => ChartStatCubit()..checkGeneralStatistic(tasks),
      child: BlocBuilder<ChartStatCubit, ChartStatState>(
        builder: (context, state) {
          return Scaffold(
            backgroundColor: AppColors.scaffoldBackground,
            appBar: AppBar(
              title: Text(l10n.singleTask),
            ),
            body: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ActionButton(
                        text: l10n.all,
                        onTap: () => context
                            .read<ChartStatCubit>()
                            .checkGeneralStatistic(tasks)),
                    ActionButton(
                        text: l10n.day,
                        onTap: () => context
                            .read<ChartStatCubit>()
                            .checkDailyStatistics(tasks)),
                    ActionButton(
                        text: l10n.month,
                        onTap: () => context
                            .read<ChartStatCubit>()
                            .checkDailyStatistics(tasks)),
                  ],
                ),
                const Gap(_spaceBetweenMenuPieChart),
                SizedBox(
                  width: MediaQuery.of(context).size.width,
                  height: 300,
                  child: PieChart(
                      swapAnimationDuration: const Duration(milliseconds: 750),
                      PieChartData(sections: [
                        PieChartSectionData(
                            value: state.statistic[0].toDouble(),
                            title: l10n.planned,
                            radius: 70,
                            color: AppColors.plannedColor),
                        PieChartSectionData(
                            value: state.statistic[1].toDouble(),
                            title: l10n.executing,
                            radius: 70,
                            color: AppColors.executingColor),
                        PieChartSectionData(
                            value: state.statistic[2].toDouble(),
                            title: l10n.done,
                            radius: 70,
                            color: AppColors.doneColor),
                      ])),
                ),
                const Gap(_spaceBetweenMenuPieChart),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      "${l10n.planned}: ${state.statistic[0]}",
                      style: AppTextStyles.descriptionMid,
                    ),
                    Text(
                      "${l10n.executing}: ${state.statistic[0]}",
                      style: AppTextStyles.descriptionMid,
                    ),
                    Text(
                      "${l10n.done}: ${state.statistic[0]}",
                      style: AppTextStyles.descriptionMid,
                    ),
                  ],
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
