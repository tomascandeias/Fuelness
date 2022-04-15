import 'dart:core';

import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:homework/db/DatabaseHandler.dart';
import 'package:homework/screens/steps/text_section_with_icon.dart';

import '../../models/steps.dart';
import 'package:homework/main.dart';


class DailySteps extends StatefulWidget {
  @override
  _DailyStepsState createState() => _DailyStepsState();
}


class _DailyStepsState extends State<DailySteps> {
  static const double _hpad = 16;

  var db = DatabaseHandler.instance;
  late final Box box;
  late Steps steps;

  @override
  void initState() {
    super.initState();
    box = Hive.box("steps");
    steps = box.get(DateTime.now().toUtc()) ?? Steps(DateTime.now().toUtc(), 0);
  }


  @override
  void dispose() {
    Hive.close();
  }

  @override
  Widget build(BuildContext context) {

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
                Column(
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
                ),
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
                TextSectionWithIcon(0xf32c, steps.numberOfSteps.toString(), "steps"),
                TextSectionWithIcon(0xe392, steps.calories.toString(), "Cal"),
                TextSectionWithIcon(0xe3ab, steps.km.toStringAsFixed(2), "Km")
              ],
            )));
  }
}
