import 'package:charts_flutter/flutter.dart' as charts;
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:homework/db/DatabaseHandler.dart';
import '../../models/steps.dart';

class WeeklyStepsChart extends StatelessWidget {
  final List<charts.Series> seriesList;
  final bool animate;

  WeeklyStepsChart(this.seriesList, {required this.animate});

  /// Creates a [BarChart] with sample data and no transition.
  factory WeeklyStepsChart.withSampleData() {
    return WeeklyStepsChart(
      getStepsData(),
      // Disable animations for image tests.
      animate: false,
    );
  }

  @override
  Widget build(BuildContext context) {
    return charts.BarChart(
      List.from(seriesList),
      animate: animate,
    );
  }

  static List<charts.Series<Steps, String>> getStepsData() {
    print("getStepsData()");
    var db = DatabaseHandler.instance;
    List<Steps> weeklySteps = db.getWeeklySteps(DateTime.now());
    for (int i=0; i<weeklySteps.length; i++){
      print(weeklySteps[i].date.toUtc().toString() + "\t" + weeklySteps[i].valuesToString());
    }

    return [
      charts.Series<Steps, String>(
        id: 'Steps',
        colorFn: (_, __) => charts.MaterialPalette.red.shadeDefault,
        domainFn: (Steps steps, _) =>
            "${steps.date.day}/${steps.date.month}",
        measureFn: (Steps steps, _) => steps.numberOfSteps,
        data: weeklySteps,
      )
    ];
  }
}
