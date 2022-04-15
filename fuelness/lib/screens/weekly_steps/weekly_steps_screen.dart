import 'package:flutter/material.dart';
import 'package:homework/screens/weekly_steps/weekly_steps_chart.dart';

class WeeklyStepsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

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
