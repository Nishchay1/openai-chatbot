import 'package:chatbot/screens/buddha_screen.dart';
import 'package:flutter/material.dart';

import 'screens/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Ask Buddha',
      theme: ThemeData(
        useMaterial3: true,
      ),
      home: const HomeScreen(),
      routes: {
        '/buddhascreen': (context) => const BuddhaScreen(),
        '/homescreen': (context) => const HomeScreen(),
      },
    );
  }
}

