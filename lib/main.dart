import 'package:chatbot/screens/aristotle_screen.dart';
import 'package:chatbot/screens/buddha_screen.dart';
import 'package:chatbot/screens/caesar_screen.dart';
import 'package:chatbot/screens/confucius_screen.dart';
import 'package:chatbot/screens/curie_screen.dart';
import 'package:chatbot/screens/lincoln_screen.dart';
import 'package:chatbot/screens/mlk_screen.dart';
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
      title: 'Ask Historical Figures',
      theme: ThemeData(
        useMaterial3: true,
      ),
      home: const HomeScreen(),
      routes: {
        '/buddha_screen': (context) => const BuddhaScreen(),
        '/home_screen': (context) => const HomeScreen(),
        '/aristotle_screen': (context) => const AristotleScreen(),
        '/confucius_screen': (context) => const ConfuciusScreen(),
        '/lincoln_screen': (context) => const LincolnScreen(),
        '/caesar_screen': (context) => const CaesarScreen(),
        '/curie_screen': (context) => const CurieScreen(),
        '/mlk_screen': (context) => const MlkScreen(),
      },
    );
  }
}

