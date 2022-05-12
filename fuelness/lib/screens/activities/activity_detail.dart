import 'package:flutter/material.dart';
import 'package:homework/models/activity.dart';
import 'package:homework/utils/image_banner.dart';
import 'package:homework/utils/text_section.dart';

class ActivityDetail extends StatelessWidget {
  final int _id;

  ActivityDetail(this._id);

  @override
  Widget build(BuildContext context) {
    final activity = Activity.fetchByID(_id);

    return Scaffold(
        appBar: AppBar(
          title: Text(activity.name),
          backgroundColor: Colors.red,
        ),
        body: SingleChildScrollView(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                ImageBanner(activity.imagePath),
                ...textSections(activity)
              ]),
        ));
  }

  List<Widget> textSections(Activity activity) {
    return activity.facts
        .map((fact) => TextSection(fact.title, fact.body))
        .toList();
  }
}
