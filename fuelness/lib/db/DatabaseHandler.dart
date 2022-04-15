import 'package:hive_flutter/hive_flutter.dart';

import '../models/steps.dart';

class DatabaseHandler{
  final String boxSteps = "steps";

  // Singleton pattern
  static final DatabaseHandler _db = DatabaseHandler._internal();
  DatabaseHandler._internal();
  static DatabaseHandler get instance => _db;

  void setNumberOfSteps(Box box, int numberOfSteps) async {
    Steps steps = Steps(DateTime.now().toUtc(), numberOfSteps);
    box.put(steps.date.toUtc().toString(), steps);
  }

  Future<Steps> getDailySteps(Box box, DateTime date) async {
    return box.get(date.toUtc().toString()) ?? Steps(date, 0);
  }

  Future<List<Steps>> getWeeklySteps(Box box, DateTime date) async {
    List<Steps> ret = [];
    for (int i=6; i>0; i--){
      ret.add(box.get(date.subtract(Duration(days: i))) ?? Steps(DateTime.now().toUtc(), 0) );
    }

    ret.add(box.get(date.toUtc().toString()) ?? Steps(date, 0));

    return ret;
  }
}