import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:homework/db/DatabaseHandler.dart';
import 'package:homework/utils/title_with_icon.dart';

import '../models/steps.dart';

class ActivityInfo extends StatelessWidget {
  const ActivityInfo({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    Steps steps = DatabaseHandler.instance.getDailySteps(DateTime.now().toUtc());
    String km = steps.km.toStringAsFixed(2);
    String calories = steps.calories.toStringAsFixed(1);
    DateTime date = DateTime.now();

    return Container(

          padding: const EdgeInsets.fromLTRB(10, 50, 5, 40),
          child: Column(

              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Column(children: [
                      Text(date.day.toString() + "-" + date.month.toString() + "-" + date.year.toString(),
                          style: const TextStyle(
                              fontWeight: FontWeight.w200, fontSize: 35))
                    ])
                  ],
                ),
                Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                  Padding(padding: EdgeInsets.fromLTRB(0, 20, 0, 10),child: TitleWithIcon(Icons.directions_run.codePoint,
                      km.toString(), "km"))
                  
                ]),
                Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                  TitleWithIcon(Icons.local_fire_department.codePoint,
                      calories.toString(), "cal")
                ])
              ]));

  }
}
