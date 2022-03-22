import 'package:flutter/material.dart';
import 'package:homework/models/steps_per_day.dart';
import 'package:homework/screens/steps/daily_steps.dart';
import 'package:homework/screens/steps/weekly_steps_chart.dart';

class WeeklyStepsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final stepsData = StepsPerDay.fetchAll();

    return Scaffold(
        body: Container(
            padding: EdgeInsets.fromLTRB(25, 100, 25, 50),
            decoration: const BoxDecoration(
                image: DecorationImage(
              image: AssetImage("assets/images/background.jpeg"),
              fit: BoxFit.cover,
            )),
            child: WeeklyStepsChart(
              WeeklyStepsChart.getStepsData(),
              animate: true,
            )));
  }
}
