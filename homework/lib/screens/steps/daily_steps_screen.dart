import 'package:flutter/material.dart';
import 'package:homework/models/steps_per_day.dart';
import 'package:homework/screens/activities/text_section.dart';
import 'package:homework/screens/steps/daily_steps.dart';
import 'package:homework/screens/steps/text_section_with_icon.dart';
import 'package:homework/screens/steps/weekly_steps_chart.dart';

class DailyStepsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final stepsData = StepsPerDay.fetchAll();

    return Scaffold(
        body: Container(
            padding: const EdgeInsets.fromLTRB(10, 10, 10, 50),
            decoration: const BoxDecoration(
                image: DecorationImage(
              image: AssetImage("assets/images/background.jpeg"),
              fit: BoxFit.cover,
            )),
            child: Column(
              children: [
                DailySteps(stepsData[stepsData.length - 1]),
                Container(
                    width: 190.0,
                    height: 190.0,
                    decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                            fit: BoxFit.fill,
                            image:
                                AssetImage("assets/images/heart_beat.gif")))),
                const SizedBox(height: 50),
                TextSectionWithIcon(
                    0xf32c,
                    stepsData[stepsData.length - 1].numberOfSteps.toString(),
                    "steps"),
                TextSectionWithIcon(0xe392, "564", "Cal"),
                TextSectionWithIcon(
                    0xe3ab,
                    StepsPerDay.stepsToKm(stepsData[stepsData.length - 1])
                        .toStringAsFixed(2),
                    "Km")
              ],
            )));
  }
}
