import 'package:flutter/material.dart';
import '../../models/steps_per_day.dart';

class DailySteps extends StatelessWidget {
  final StepsPerDay steps;
  static const double _hpad = 16;

  DailySteps(this.steps);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Container(
            padding: const EdgeInsets.fromLTRB(0, _hpad * 3, 0, _hpad * 3),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("${steps.date.day}/${steps.date.month}/${steps.date.year}",
                    style: Theme.of(context).appBarTheme.titleTextStyle),
              ],
            ))
      ],
    );
  }
}
