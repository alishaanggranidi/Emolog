import 'package:flutter/material.dart';
import './features/home/moodlog.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Mood Tracker',
      theme: ThemeData(
        primarySwatch: Colors.pink,
        fontFamily: 'Arial',
      ),
      home: const MoodLogScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}
