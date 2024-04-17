import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:task_app/core/l10n/l10n.dart';
import 'package:task_app/core/themes/colors.dart';
import 'package:task_app/core/themes/text_style.dart';

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
                const Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Icon(Icons.notification_add),
                    Gap(20),
                    Icon(Icons.language),
                    Gap(10)
                  ],
                ),
              ],
            )),
      ),
    );
  }
}
