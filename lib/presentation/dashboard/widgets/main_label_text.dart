import 'package:flutter/material.dart';
import 'package:task_app/core/l10n/l10n.dart';
import 'package:task_app/core/themes/text_style.dart';

const double _containerMargin = 10;

class MainLabelText extends StatelessWidget {
  const MainLabelText(
      {super.key,
      required this.l10n,
      required this.text,
      this.allMargin = _containerMargin});

  final AppLocalizations l10n;
  final String text;
  final double allMargin;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(allMargin),
      child: Column(
        children: [
          Text(
            text,
            style: AppTextStyles.headersMedium,
          ),
          const Divider()
        ],
      ),
    );
  }
}
