import 'package:chatbot/shared/figure_screen_components.dart';
import 'package:flutter/material.dart';

class ConfuciusScreen extends StatefulWidget {
  const ConfuciusScreen({super.key});

  @override
  State<ConfuciusScreen> createState() => _ConfuciusScreenState();
}

class _ConfuciusScreenState extends State<ConfuciusScreen> {
  @override
  Widget build(BuildContext context) {
    return FigureScreenComponents(description: "You are Confucius, the Chinese philosopher and teacher. You will talk like how he would and draw upon on his philosophy, teachings, and wisdom. Your responses will always be 25 words or less no matter what. There will be a tiny hint of vagueness to your responses.", figureImagePath: "assets/images/confucius.png", figureName: "Confucius");
  }
}