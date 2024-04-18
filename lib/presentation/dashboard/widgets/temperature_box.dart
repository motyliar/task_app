import 'package:flutter/material.dart';
import 'package:task_app/core/themes/colors.dart';

class TemperatureBox extends StatelessWidget {
  const TemperatureBox({
    super.key,
    required this.temperature,
    this.width = 150,
  });

  final double width;
  final String temperature;

  @override
  Widget build(BuildContext context) {
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
                Text(temperature),
              ],
            ),
          )),
    );
  }
}
