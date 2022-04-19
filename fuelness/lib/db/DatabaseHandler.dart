import 'package:hive_flutter/hive_flutter.dart';

import '../models/steps.dart';

class DatabaseHandler{
  final String boxSteps = "steps";

  // Singleton pattern
  static final DatabaseHandler _db = DatabaseHandler._internal();
  DatabaseHandler._internal();
  static DatabaseHandler get instance => _db;

  void setNumberOfSteps(int numberOfSteps) {
    var box = Hive.box(boxSteps);
    Steps steps = Steps(DateTime.now().toUtc(), numberOfSteps);
    box.put(getDate(steps.date), steps);
  }

  Steps getDailySteps(DateTime date) {
    var box = Hive.box(boxSteps);
    return box.get(getDate(date)) ?? Steps(date, 0);
  }

  List<Steps> getWeeklySteps(DateTime date) {
    print("getWeeklySteps()");
    var box = Hive.box(boxSteps);
    List<Steps> ret = [];

    for (int i=6; i>0; i--){
      ret.add(box.get(getDate(date.subtract(Duration(days: i)))) ?? Steps(date.subtract(Duration(days: i)), 0) );
    }

    ret.add(box.get(getDate(date)) ?? Steps(date, 0));

    return ret;
  }

  // Aux functions
  String getDate(DateTime date){
    return DateTime.utc(date.year, date.month, date.day).toString();
  }
}