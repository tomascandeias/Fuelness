import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:homework/utils/activity_info.dart';
import 'package:stop_watch_timer/stop_watch_timer.dart';

import 'google_maps.dart';

Future<Position> _getGeoLocationPosition() async {
  Position position = await Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.high);
  return position;
}

class ActivityView extends StatefulWidget {
  const ActivityView({Key? key}) : super(key: key);

  @override
  _ActivityViewState createState() => _ActivityViewState();
}

class _ActivityViewState extends State<ActivityView> {
  final StopWatchTimer _stopWatchTimer = StopWatchTimer(
    mode: StopWatchMode.countUp,
    onChange: (value) => print('OnChange $value'),
    onChangeRawSecond: (value) => print('onChangeRawSecond $value'),
    onChangeRawMinute: (value) => print('onChangeRawMinute $value'),
    onStop: () {
      print('onStop');
    },
    onEnded: () {
      print('onEnded');
    },
  );

  late List<Position> locations;

  @override
  void initState() {
    super.initState();
    _stopWatchTimer.rawTime.listen((value) =>
        print('rawTime $value ${StopWatchTimer.getDisplayTime(value)}'));
    _stopWatchTimer.minuteTime.listen((value) => print('minuteTime $value'));
    _stopWatchTimer.secondTime.listen((value) => print('secondTime $value'));
    _stopWatchTimer.records.listen((value) => print('records $value'));
    _stopWatchTimer.fetchStop.listen((value) => print('stop from stream'));
    _stopWatchTimer.fetchEnded.listen((value) => print('ended from stream'));

    locations = [];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            padding: const EdgeInsets.fromLTRB(10, 10, 5, 50),
            decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("assets/images/background.jpeg"),
                    fit: BoxFit.cover)),
            child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Row(
                    children: [ActivityInfo()],
                  ),
                  Row(
                    children: [
                      const Padding(
                          padding: EdgeInsets.fromLTRB(90, 20, 0, 20),
                          child: Icon(Icons.timer, size: 40)),
                      Column(children: <Widget>[
                        StreamBuilder<int>(
                            stream: _stopWatchTimer.rawTime,
                            initialData: _stopWatchTimer.rawTime.value,
                            builder: (context, snapshot) {
                              final val = snapshot.data!;
                              final displayTime = StopWatchTimer.getDisplayTime(
                                  val,
                                  milliSecond: false);
                              return Column(
                                children: <Widget>[
                                  Padding(
                                    padding:
                                        const EdgeInsets.fromLTRB(30, 5, 0, 0),
                                    child: Text(
                                      displayTime,
                                      style: const TextStyle(
                                          fontSize: 27,
                                          fontFamily: 'Helvetica',
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                ],
                              );
                            })
                      ])
                    ],
                  ),
                  Row(
                    children: [
                      Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.fromLTRB(80, 0, 10, 30),
                              child: RaisedButton(
                                padding: const EdgeInsets.all(4),
                                color: Colors.redAccent,
                                shape: const StadiumBorder(),
                                onPressed: () async {
                                  _stopWatchTimer.onExecute
                                      .add(StopWatchExecute.start);

                                  _getGeoLocationPosition().then((Position result){
                                    setState(() {
                                      locations.add(result);
                                    });
                                  });
                                },
                                child: const Text(
                                  'Start',
                                  style: TextStyle(color: Colors.white),
                                ),
                              ),
                            ),
                          ]),
                      Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.fromLTRB(5, 0, 30, 30),
                            child: RaisedButton(
                              padding: const EdgeInsets.all(4),
                              color: Colors.orange,
                              shape: const StadiumBorder(),
                              onPressed: () async {
                                _stopWatchTimer.onExecute
                                    .add(StopWatchExecute.stop);

                                _getGeoLocationPosition().then((Position result){
                                  setState(() {
                                    locations.add(result);
                                    _seeMaps(context);
                                  });
                                });
                              },
                              child: const Text(
                                'Stop',
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ])));
  }

  _seeMaps(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: ((context) => GoogleMaps(locations))),
    );
  }
}
