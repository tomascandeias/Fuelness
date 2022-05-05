import 'package:flutter/material.dart';
import 'package:homework/screens/alarm/alarm_widget.dart';
import 'package:homework/screens/alarm/clock_widget.dart';
import 'package:homework/models/alarm.dart';
import 'package:homework/screens/alarm/dailymsg_screen.dart';
import 'package:homework/screens/alarm/notifications.dart';
import 'package:homework/services/ApiRequests.dart';
import 'package:timezone/data/latest.dart' as tz;

class AlarmWithDailyQuotes extends StatefulWidget {
  @override
  _AlarmWithDailyQuotesState createState() => _AlarmWithDailyQuotesState();
}

class _AlarmWithDailyQuotesState extends State<AlarmWithDailyQuotes> {
  bool _isActive = true;

  @override
  void initState() {
    super.initState();
    tz.initializeTimeZones();

    NotificationApi.init();
    listenNotifications();
  }

  void listenNotifications() =>
      NotificationApi.onNotifications.stream.listen(onClickedNotification);

  void onClickedNotification(String? payload) {
    //openedAt.add(add(payload));
    Navigator.of(context).push(MaterialPageRoute(
      builder: (context) => DailyMsg(payload!),
    ));
  } // Go to Statistic Page Function

  void _setAlarm() {
    setState(() {
      _isActive = !_isActive;
    });
  } // Function to change between Alarm or Clock

  int _AmPm(h) {
    if (isAm == true) {
      return h;
    } else {
      return h + 12;
    }
  } // Used to adjust time based on Am Pm

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.fromLTRB(10, 10, 10, 50),
        decoration: const BoxDecoration(
            image: DecorationImage(
          image: AssetImage("assets/images/background.jpeg"),
          fit: BoxFit.cover,
        )),
        child: Column(
          children: <Widget>[
            Expanded(
              // List of Active Alarm
              flex: 1,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: ListView.builder(
                  itemBuilder: (context, index) {
                    final Alarm place = alarmList[index];
                    return Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: <Widget>[
                            IconButton(
                              onPressed: () {
                                NotificationApi.cancelNotification(
                                    _AmPm(place.hour) + place.minute);
                                setState(() {
                                  deleteAlarm(index);
                                });
                              },
                              icon: const Icon(
                                Icons.delete_outline_outlined,
                                color: Colors.white,
                              ),
                            ),
                            Text(
                              place.hour.toString().padLeft(2, '0') +
                                  ' : ' +
                                  place.minute.toString().padLeft(2, '0'),
                              style: const TextStyle(
                                  fontSize: 32, color: Colors.white),
                            ),
                            Column(
                              children: [
                                InkWell(
                                  onTap: () {
                                    setState(() {
                                      place.isAm = true;
                                    });
                                  },
                                  child: Text(
                                    'AM',
                                    style: TextStyle(
                                        color: (place.isAm == true)
                                            ? Colors.white
                                            : Colors.red),
                                  ),
                                ),
                                Text(
                                  'PM',
                                  style: TextStyle(
                                      color: (place.isAm == true)
                                          ? Colors.red
                                          : Colors.white),
                                ),
                              ],
                            ),
                          ],
                        ),
                        const Divider(
                          color: Colors.white,
                        )
                      ],
                    );
                  },
                  itemCount: alarmList.length,
                ),
              ),
            ),
            Expanded(
              // Changing between Clock or Alarm
              flex: 1,
              child: Stack(
                children: [
                  Visibility(
                    child: ClockWidget(),
                    visible: _isActive,
                  ),
                  Visibility(
                    child: AlarmWidget(),
                    visible: !_isActive,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
      bottomNavigationBar: Container(
        color: Colors.white,
        height: 50,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            IconButton(
              icon: (_isActive == true)
                  ? const Icon(Icons.alarm)
                  : const Icon(Icons.access_time),
              onPressed: () {
                setState(() {
                  _setAlarm();
                });
              },
            ),
            IconButton(
              icon: const Icon(Icons.add),
              onPressed: () {
                var api = ApiRequests.instance;
                api.makePostRequest().then((String result){
                  var msg = result.split("-");
                  NotificationApi.showScheduledNotification(
                      id: _AmPm(hour) + minute,
                      title: msg[1] == "null" ?
                          "Right now at" : msg[1] + ", right now at " +
                          hour.toString().padLeft(2, '0') +
                          ' : ' +
                          minute.toString().padLeft(2, '0'),
                      body: msg[0],
                      payload: result,
                      when: DateTime(DateTime.now().year, DateTime.now().month,
                          DateTime.now().day, _AmPm(hour), minute));
                });

                setState(() {
                  addAlarm();
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}
