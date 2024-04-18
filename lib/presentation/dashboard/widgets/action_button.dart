import 'package:flutter/material.dart';
import 'package:task_app/core/themes/text_style.dart';

class ActionButton extends StatelessWidget {
  const ActionButton({
    super.key,
    required this.text,
    required this.onTap,
    this.textStyle = AppTextStyles.descriptionSmall,
  });

  final String text;
  final VoidCallback onTap;
  final TextStyle textStyle;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: () => onTap(), child: Text(text, style: textStyle));
  }
}
