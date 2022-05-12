import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:homework/screens/activities/activity_view.dart';

import 'activities.dart';

class ActivityMenu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            height: MediaQuery.of(context).size.height,
            decoration: const BoxDecoration(
                image: DecorationImage(
              image: AssetImage("assets/images/background.jpeg"),
              fit: BoxFit.cover,
            )),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Padding(
                    padding: const EdgeInsets.fromLTRB(50, 300, 50, 30),
                    child: ElevatedButton(
                        onPressed: () => _onActivityClick(context),
                        style: ElevatedButton.styleFrom(
                            textStyle: const TextStyle(fontSize: 25),
                            primary: Colors.red),
                        child: const Text("Activity Start"))),
                Padding(
                    padding: EdgeInsets.fromLTRB(50, 0, 50, 30),
                    child: ElevatedButton(
                        onPressed: () => _onGuideClick(context),
                        style: ElevatedButton.styleFrom(
                            textStyle: const TextStyle(fontSize: 25),
                            primary: Colors.red),
                        child: const Text("Guide")))
              ],
            )));
  }

  _onActivityClick(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: ((context) => ActivityView())),
    );
  }

  _onGuideClick(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: ((context) => Activities())),
    );
  }
}
