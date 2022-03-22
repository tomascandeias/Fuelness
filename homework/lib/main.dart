import 'dart:io';

import 'package:flutter/material.dart';
import 'package:homework/screens/activities/activities.dart';
import 'package:homework/screens/greetings/welcome_page.dart';
import 'package:homework/screens/steps/weekly_steps_screen.dart';
import 'package:homework/style.dart';

import 'screens/steps/daily_steps_screen.dart';

void main() {
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
  int _selectedIndex = 0;

  final _pageOptions = [
    DailyStepsScreen(),
    WeeklyStepsScreen(),
    Activities(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _pageOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.directions_run),
            label: 'Daily',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.auto_graph),
            label: 'Weekly',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.book),
            label: 'Guide',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.amber[800],
        onTap: _onItemTapped,
      ),
    );
  }
}
