import 'dart:async';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:homework/screens/alarm/clock_painter.dart';

class Clock extends StatefulWidget {
  @override
  _ClockState createState() => _ClockState();
}

class _ClockState extends State<Clock> {

  int secondclock = 0;
  int minuteclock = 0;
  int hourclock = 0;
  late Timer timer;
  bool _isAm = true;

  @override
  void initState(){
    super.initState();
    timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      final now = DateTime.now();
      if (mounted){
        setState(() {
          secondclock = now.second;
          minuteclock = now.minute;
          if (now.hour >= 12) {
            _isAm = false;
            hourclock = now.hour - 12;
          } else {
            hourclock = now.hour;
            _isAm = true;
          }
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
                        minute: minuteclock,
                        hour: hourclock,
                        isAM: _isAm
                    ),
                  ),
                ),
                Text(
                  hourclock.toString().padLeft(2, '0') + ' : ' + minuteclock.toString().padLeft(2, '0'),
                  style: const TextStyle(color: Colors.white, fontSize: 24),
                ),
                Container(
                  height: 60,
                  width: 130,
                  child: Container(
                    alignment: Alignment.bottomCenter,
                    height: 30,
                    width: 65,
                    child: Text((_isAm == true) ? 'AM' : 'PM',
                      style: TextStyle(
                        color: (_isAm == true) ? Colors.red : Colors.blueAccent,
                      ),
                    ),
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