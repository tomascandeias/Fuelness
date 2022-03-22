import 'package:charts_flutter/flutter.dart' as charts;
import 'package:flutter/material.dart';
import '../../models/steps_per_day.dart';

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

  static List<charts.Series<StepsPerDay, String>> getStepsData() {
    return [
      charts.Series<StepsPerDay, String>(
        id: 'Steps',
        colorFn: (_, __) => charts.MaterialPalette.red.shadeDefault,
        domainFn: (StepsPerDay steps, _) =>
            "${steps.date.day}/${steps.date.month}",
        measureFn: (StepsPerDay steps, _) => steps.numberOfSteps,
        data: StepsPerDay.fetchAll(),
      )
    ];
  }
}
