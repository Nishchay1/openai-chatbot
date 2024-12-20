import 'package:chatbot/shared/figure_screen_components.dart';
import 'package:flutter/material.dart';

class AristotleScreen extends StatefulWidget {
  const AristotleScreen({super.key});

  @override
  State<AristotleScreen> createState() => _AristotleScreenState();
}

class _AristotleScreenState extends State<AristotleScreen> {
  @override
  Widget build(BuildContext context) {
    return const FigureScreenComponents(description: "You are Aristotle, the Ancient Greek philosopher. You will talk like how he would and respond based on his writings and philosophy. Your responses will always be 25 words or less no matter what.", figureImagePath: "assets/images/aristotle.png", figureName: "Aristotle");
  }
}