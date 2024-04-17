import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:gap/gap.dart';
import 'package:task_app/core/constans/export.dart';
import 'package:task_app/core/l10n/l10n.dart';
import 'package:task_app/core/router/route_animation.dart';
import 'package:task_app/core/themes/colors.dart';
import 'package:task_app/core/themes/text_style.dart';
import 'package:task_app/domain/entity/task_entity.dart';
import 'package:task_app/domain/subentity/data_marker.dart';
import 'package:task_app/domain/subentity/task_status.dart';
import 'package:task_app/presentation/dashboard/business/switch_button.dart';
import 'package:task_app/presentation/dashboard/widgets/custom_sliver_appbar.dart';
import 'package:task_app/presentation/dashboard/widgets/main_label_text.dart';
import 'package:task_app/presentation/dashboard/widgets/single_task.dart';

const double _emptySpaceToEndPage = 100;

class Dashboard extends StatelessWidget {
  const Dashboard({super.key});

  static Route route() {
    return RouteAnimations.slidingDownRoute(
        child: const Dashboard(), route: kDashBoardPage);
  }

  @override
  Widget build(BuildContext context) {
    bool isPriority = false;
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
                child: Column(
                  children: List.generate(
                      10,
                      (index) => SingleTask(
                            task: singleEntity,
                          )),
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
            showModalBottomSheet(
                context: context,
                builder: (context) => BlocProvider(
                      create: (context) => SwitchButtonCubit(),
                      child: Form(
                          child: Padding(
                        padding:
                            const EdgeInsets.only(left: 30, right: 10, top: 20),
                        child: Column(
                          children: [
                            TextFormField(
                              maxLength: 50,
                              decoration:
                                  const InputDecoration(hintText: 'title'),
                            ),
                            TextFormField(
                              maxLength: 500,
                              minLines: 4,
                              maxLines: 10,
                              decoration: const InputDecoration(
                                  hintText: 'description'),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                SizedBox(
                                  width:
                                      MediaQuery.of(context).size.width * 0.5,
                                  child: TextFormField(
                                    maxLength: 20,
                                    decoration: const InputDecoration(
                                        hintText: 'owner'),
                                  ),
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    const Text("Is priority?"),
                                    const Gap(5),
                                    BlocBuilder<SwitchButtonCubit, bool>(
                                      builder: (context, state) {
                                        return GestureDetector(
                                          onTap: () => context
                                              .read<SwitchButtonCubit>()
                                              .changePriority(),
                                          child: CheckBox(
                                            visible: state,
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
                              child: TextButton(
                                  onPressed: () => showDatePicker(
                                          context: context,
                                          initialDate: DateTime.now(),
                                          firstDate: DateTime.now(),
                                          lastDate: DateTime(2026))
                                      .then((value) => null),
                                  child: const Text("choose date")),
                            ),
                            ElevatedButton(
                                onPressed: () {}, child: const Text("ADD")),
                          ],
                        ),
                      )),
                    ));
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

class CheckBox extends StatelessWidget {
  const CheckBox({super.key, required this.visible});

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

TaskEntity singleEntity = TaskEntity(
    id: '11',
    title: "Umyć podłogę",
    description: "Dzisiaj należy umyć podłogę i pozmywać naczynia",
    deadline: DateTime.now(),
    owner: "Wacek",
    status: TaskStatus.planned,
    stat: DateStat(
        create: DateMarker.currentDay(),
        execution: DateMarker(),
        done: DateMarker()));
