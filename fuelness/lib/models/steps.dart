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
}
