import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:homework/models/record_instance.dart';
import 'package:homework/utils/text_section_with_icon.dart';
import 'package:homework/utils/title_with_icon.dart';

class ActivityInfo extends StatelessWidget {
  const ActivityInfo({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    double km = 16.5;
    double calories = 1400;
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
                  TitleWithIcon(Icons.fire_extinguisher.codePoint,
                      calories.toString(), "kcal")
                ])
              ]));

  }
}
