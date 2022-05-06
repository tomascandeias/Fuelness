import 'dart:async';

import 'package:flutter/material.dart';
import 'package:homework/screens/alarm/clock_painter.dart';
import 'package:homework/models/alarm.dart';
import 'package:sleek_circular_slider/sleek_circular_slider.dart';

int minute = 0;
int hour = 0;

bool isAm = true;
bool isActive = true;

class AlarmWidget extends StatefulWidget {
  @override
  _AlarmWidgetState createState() => _AlarmWidgetState();
}

class _AlarmWidgetState extends State<AlarmWidget> {
  late Timer timer;
  int secondclock = 0;

  @override
  void initState() {
    super.initState();
    timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      final now = DateTime.now();
      if (mounted) {
        setState(() {
          secondclock = now.second;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Center(
          child: Container(
            alignment: Alignment.center,
            padding: const EdgeInsets.all(8.0),
            child: Stack(
              alignment: Alignment.center,
              children: <Widget>[
                Container(
                  height: 300,
                  width: 300,
                  child: CustomPaint(
                    size: const Size(250, 250),
                    painter: ClockPainter(
                        second: secondclock,
                        minute: minute,
                        hour: hour,
                        isAM: isAm),
                  ),
                ),
                Container(
                  height: 300,
                  width: 300,
                  alignment: Alignment.center,
                  child: SleekCircularSlider(
                    initialValue: (isActive == true) ? 12 : 60,
                    min: 0,
                    max: (isActive == true) ? 12 : 60,
                    onChange: (value) {
                      if (isActive == true) {
                        setState(() {
                          hour = value.toInt();
                        });
                      } else {
                        setState(() {
                          minute = value.toInt();
                        });
                      }
                    },
                    appearance: CircularSliderAppearance(
                        startAngle: 270,
                        angleRange: 360,
                        size: 200,
                        customColors: CustomSliderColors(
                          shadowMaxOpacity: 0,
                          dotColor: Colors.transparent,
                          progressBarColor: Colors.transparent,
                          shadowColor: Colors.transparent,
                          trackColor: Colors.transparent,
                          dynamicGradient: false,
                        )),
                    innerWidget: (value) {
                      return Center(
                          child: Text(
                        hour.toString().padLeft(2, '0') +
                            ' : ' +
                            minute.toString().padLeft(2, '0'),
                        style:
                            const TextStyle(fontSize: 24, color: Colors.white),
                      ));
                    },
                  ),
                ),
                Container(
                  height: 60,
                  width: 130,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Visibility(
                        visible: true,
                        maintainSize: true,
                        maintainAnimation: true,
                        maintainState: true,
                        child: InkWell(
                          onTap: () {
                            setState(() {
                              isActive = !isActive;
                            });
                          },
                          child: Container(
                            alignment: Alignment.topCenter,
                            height: 30,
                            width: 65,
                            child: Text(
                              (isActive == true) ? 'Hour' : 'Minute',
                              style: TextStyle(
                                  color: (isActive == true)
                                      ? Colors.red
                                      : Colors.red),
                            ),
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          setState(() {
                            isAm = !isAm;
                          });
                        },
                        child: Container(
                          alignment: Alignment.bottomCenter,
                          height: 30,
                          width: 65,
                          child: Text(
                            (isAm == true) ? 'AM' : 'PM',
                            style: TextStyle(
                              color: (isAm == true)
                                  ? Colors.red
                                  : Colors.red,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ], //children Column
    );
  }
}

void addAlarm() {
  return alarmList.insert(
      0, Alarm(hour: hour, minute: minute, isAm: isAm, isActive: true));
}
