import 'package:hive/hive.dart';

part 'steps.g.dart';

@HiveType(typeId: 1)
class Steps {
  @HiveField(0)
  final DateTime _date;

  @HiveField(1)
  int numberOfSteps;

  @HiveField(2)
  double? _calories;

  @HiveField(3)
  double? _km;

  Steps(this._date, this.numberOfSteps);

  void setSteps(int steps){
    numberOfSteps = steps;
    _calories = calories;
    _km = km;
  }


  DateTime get date => _date;

  double get calories => numberOfSteps * 0.063 ;

  double get km => numberOfSteps / 1312.33595801;

  String valuesToString() {
    return '$numberOfSteps,$calories,$km';
  }

/*
  static List<StepsPerDay> fetchAll() {
    return [
      StepsPerDay(DateTime.utc(2022, 3, 17), 6380),
      StepsPerDay(DateTime.utc(2022, 3, 18), 4872),
      StepsPerDay(DateTime.utc(2022, 3, 19), 3485),
      StepsPerDay(DateTime.utc(2022, 3, 20), 2974),
      StepsPerDay(DateTime.utc(2022, 3, 21), 8938),
      StepsPerDay(DateTime.utc(2022, 3, 22), 8739),
      StepsPerDay(DateTime.utc(2022, 3, 23), 9550),
    ];
  }

  static StepsPerDay fetchByDay(DateTime dt) {
    List<StepsPerDay> steps = StepsPerDay.fetchAll();
    for (var i = 0; i < steps.length; i++) {
      if (steps[i].date.year == dt.year &&
          steps[i].date.month == dt.month &&
          steps[i].date.day == dt.day) {
        return steps[i];
      }
    }
    return steps[0];
  }

  static double stepsToKm(StepsPerDay steps) {
    return (steps.numberOfSteps / 1312.33595801);
  } */
}
