import 'package:flutter/material.dart';
import 'package:flutter_application_1/calender/apptheme.dart';
import 'package:flutter_application_1/calender/screen.dart';

void main() {
  runApp(const CalendarApp());
}

class CalendarApp extends StatelessWidget {
  const CalendarApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Calendar App',
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      home: const CalendarScreen(),
    );
  }
}
