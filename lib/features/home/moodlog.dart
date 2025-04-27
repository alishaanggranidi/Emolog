import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

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
      debugShowCheckedModeBanner: false,
      home: const MoodLogScreen(),
    );
  }
}

class MoodLogScreen extends StatelessWidget {
  const MoodLogScreen({super.key});

  // Data mood untuk seminggu
  final List<Map<String, dynamic>> moodData = const [
    {'day': 'Senin', 'moods': ['😭', '😐', '😂'], 'highlight': 2},
    {'day': 'Selasa', 'moods': ['😭', '😐', '😂'], 'highlight': 1},
    {'day': 'Rabu', 'moods': ['😭', '😐', '😂'], 'highlight': 2},
    {'day': 'Kamis', 'moods': ['😭', '😐', '😂'], 'highlight': 1},
    {'day': 'Jumat', 'moods': ['😭', '😐', '😂'], 'highlight': 0},
    {'day': 'Sabtu', 'moods': ['😭', '😐', '😂'], 'highlight': 1},
    {'day': 'Minggu', 'moods': ['😭', '😐', '😂'], 'highlight': 2},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            // Header (tidak di-scroll)
            Container(
              padding: const EdgeInsets.all(20),
              decoration: const BoxDecoration(
                color: Color(0xFFF7D8DE),
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(20),
                  bottomRight: Radius.circular(20),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text("Hey, Khansa 👍", style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
                  const SizedBox(height: 4),
                  const Text("Review Your Mood History", style: TextStyle(fontSize: 16, color: Color(0xFF7A7A7A))),
                  const SizedBox(height: 12),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      border: Border.all(color: const Color(0xFFE4A9B8), width: 1),
                    ),
                    child: Row(
                      children: [
                        Expanded(
                          child: Container(
                            padding: const EdgeInsets.symmetric(vertical: 10),
                            decoration: BoxDecoration(
                              color: const Color(0xFFD48DA2),
                              borderRadius: BorderRadius.circular(30),
                            ),
                            child: const Center(
                              child: Text('Mood log', style: TextStyle(color: Colors.white)),
                            ),
                          ),
                        ),
                        Expanded(
                          child: Container(
                            padding: const EdgeInsets.symmetric(vertical: 10),
                            decoration: const BoxDecoration(
                              borderRadius: BorderRadius.only(
                                topRight: Radius.circular(30),
                                bottomRight: Radius.circular(30),
                              ),
                            ),
                            child: const Center(
                              child: Text('Mood Mate', style: TextStyle(color: Colors.black)),
                            ),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),

            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(Icons.arrow_back_ios, size: 16),
                  const SizedBox(width: 6),
                  Container(
                    padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
                    decoration: BoxDecoration(
                      border: Border.all(color: const Color(0xFFE4A9B8), width: 1),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: const Text("Jan 29 - Feb 05", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14)),
                  ),
                  const SizedBox(width: 6),
                  const Icon(Icons.arrow_forward_ios, size: 16),
                ],
              ),
            ),

            Expanded(
              child: ListView.builder(
                itemCount: moodData.length,
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                physics: const AlwaysScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  final item = moodData[index];
                  return Container(
                    margin: const EdgeInsets.only(bottom: 12),
                    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(16),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.1),
                          spreadRadius: 1,
                          blurRadius: 6,
                          offset: const Offset(0, 2),
                        ),
                      ],
                    ),
                    child: Row(
                      children: [
                        SizedBox(
                          width: 70,
                          child: Text(
                            item['day'],
                            style: const TextStyle(fontSize: 16, color: Color(0xFF7A7A7A)),
                          ),
                        ),
                        ...item['moods'].asMap().entries.map((entry) {
                          final moodIndex = entry.key;
                          final mood = entry.value;
                          final isHighlight = moodIndex == item['highlight'];
                          return Expanded(
                            child: Container(
                              alignment: Alignment.center,
                              padding: const EdgeInsets.all(8),
                              decoration: BoxDecoration(
                                color: isHighlight ? const Color(0xFFF7D8DE) : Colors.transparent,
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: Text(mood, style: const TextStyle(fontSize: 24)),
                            ),
                          );
                        }).toList(),
                      ],
                    ),
                  );
                },
              ),
            ),

            // Bottom Navigation (tidak di-scroll)
            Container(
              padding: const EdgeInsets.symmetric(vertical: 16),
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.1),
                    spreadRadius: 0,
                    blurRadius: 10,
                    offset: const Offset(0, -5),
                  ),
                ],
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Column(
                    children: [
                      Icon(Icons.home, color: const Color(0xFFD48DA2)),
                      Container(
                        width: 20,
                        height: 3,
                        color: const Color(0xFFD48DA2),
                      ),
                    ],
                  ),
                  const Icon(Icons.book, color: Colors.grey),
                  const Icon(Icons.settings, color: Colors.grey),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}