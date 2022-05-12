import 'dart:async';
import 'dart:io';

import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:homework/db/DatabaseHandler.dart';
import 'package:homework/models/steps.dart';
import 'package:homework/screens/activities/activities.dart';
import 'package:homework/screens/activities/activity_menu.dart';
import 'package:homework/screens/alarm/alarm_quotes_screen.dart';
import 'package:homework/screens/private_journal/private_journal.dart';
import 'package:homework/screens/steps/daily_steps_screen.dart';
import 'package:homework/screens/greetings/welcome_page.dart';
import 'package:homework/screens/weekly_steps/weekly_steps_screen.dart';
import 'package:homework/style.dart';

Future<void> main() async {
  await Hive.initFlutter();
  Hive.registerAdapter(StepsAdapter());
  if (!Hive.isBoxOpen("steps")) {
    var box = await Hive.openBox("steps");
  }

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Fuelness',
      debugShowCheckedModeBanner: false,
      theme: _theme(),
      //home: const MyStatefulWidget(),
      home: WelcomeScreen(),
    );
  }
}

ThemeData _theme() {
  return ThemeData(
    appBarTheme: AppBarTheme(
      titleTextStyle: const TextTheme(
        titleLarge: AppBarTextStyle,
      ).headline6,
    ),
    textTheme: const TextTheme(
      titleMedium: TitleTextStyle,
      bodyMedium: Body1TextStyle,
    ),
  );
}

// Bottom navigation bar
class MyStatefulWidget extends StatefulWidget {
  const MyStatefulWidget({Key? key}) : super(key: key);

  @override
  State<MyStatefulWidget> createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<MyStatefulWidget> {
  int selectedPage = 0;
  final _pageOptions = [
    DailySteps(),
    WeeklySteps(),
    ActivityMenu(),
    AlarmWithDailyQuotes(),
    PrivateJournal(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pageOptions[selectedPage],
      bottomNavigationBar: ConvexAppBar(
        backgroundColor: Colors.amber[800],
        style: TabStyle.titled,
        activeColor: Colors.white,
        items: const [
          TabItem(icon: Icons.directions_run, title: 'Daily'),
          TabItem(icon: Icons.auto_graph, title: 'Weekly'),
          TabItem(icon: Icons.fitness_center, title: 'Activities'),
          TabItem(icon: Icons.alarm, title: 'Alarm'),
          TabItem(icon: Icons.book, title: 'Journal'),
        ],
        initialActiveIndex: 0, //optional, default as 0
        onTap: (int i) {
          setState(() {
            selectedPage = i;
          });
        },
      ),
    );
  }
}
