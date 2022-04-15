import 'package:charts_flutter/flutter.dart' as charts;
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import '../../db/DatabaseHandler.dart';
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
    List<Steps> weeklySteps = [];
    /*
    final Box box = Hive.openBox("steps");
    for (int i=6; i>0; i--){
      weeklySteps.add(box.get(DateTime.now().toUtc().subtract(Duration(days: i))) ?? Steps(DateTime.now().toUtc(), 0) );
    }

    weeklySteps.add(box.get(date.toUtc().toString()) ?? Steps(date, 0));
    */
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
