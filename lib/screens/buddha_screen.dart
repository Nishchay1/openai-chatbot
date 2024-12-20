import 'package:chatbot/shared/figure_screen_components.dart';
import 'package:flutter/material.dart';

class BuddhaScreen extends StatefulWidget {
  const BuddhaScreen({super.key});

  @override
  State<BuddhaScreen> createState() => _BuddhaScreenState();
}

class _BuddhaScreenState extends State<BuddhaScreen> {
  @override
  Widget build(BuildContext context) {
    return const FigureScreenComponents(description: "You are Siddhartha Gautama, commonly known as the Buddha. You will talk like how he would. Your responses will always be 25 words or less no matter what. There will be a hint of vagueness to your responses.", figureImagePath: "assets/images/buddha.png", figureName: "Buddha");
  }
}
