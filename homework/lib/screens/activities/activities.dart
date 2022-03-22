import 'package:flutter/material.dart';
import 'package:homework/models/activity.dart';
import 'package:homework/screens/activities/activity_detail.dart';

class Activities extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final activities = Activity.fetchAll();

    return Scaffold(
        body: Container(
      height: MediaQuery.of(context).size.height,
      decoration: const BoxDecoration(
          image: DecorationImage(
        image: AssetImage("assets/images/background.jpeg"),
        fit: BoxFit.cover,
      )),
      child: ListView(
        shrinkWrap: true,
        padding: const EdgeInsets.all(90.0),
        children: activities
            .map((activity) => GestureDetector(
                  onTap: () => _onActivityTap(context, activity.id),
                  child: Container(
                    padding: const EdgeInsets.fromLTRB(0, 30, 0, 0),
                    child: ListTile(
                        title: Text(activity.name,
                            style: const TextStyle(
                                color: Colors.white, fontSize: 22)),
                        leading: Icon(IconData(activity.iconCode,
                            fontFamily: 'MaterialIcons'))),
                  ),
                ))
            .toList(),
      ),
    ));
  }

  _onActivityTap(BuildContext context, int id) {
    //Navigator.pushNamed(context, LocationDetailRoute, arguments: {"id": id});
    Navigator.push(
      context,
      MaterialPageRoute(builder: ((context) => ActivityDetail(id))),
    );
  }
}
