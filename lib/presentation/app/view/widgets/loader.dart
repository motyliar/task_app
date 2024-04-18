import 'package:flutter/material.dart';
import 'package:task_app/core/l10n/l10n.dart';
import 'package:task_app/core/themes/colors.dart';
import 'package:task_app/core/themes/text_style.dart';

class LoaderPage extends StatelessWidget {
  const LoaderPage({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return Material(
      child: Column(
        children: [
          Text(l10n.loading, style: AppTextStyles.descriptionBig),
          const LinearProgressIndicator(
            backgroundColor: AppColors.accent,
          ),
        ],
      ),
    );
  }
}
