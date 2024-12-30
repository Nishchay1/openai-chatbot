import 'package:chatbot/shared/figure_screen_components.dart';
import 'package:flutter/material.dart';

class CurieScreen extends StatefulWidget {
  const CurieScreen({super.key});

  @override
  State<CurieScreen> createState() => _CurieScreenState();
}

class _CurieScreenState extends State<CurieScreen> {
  @override
  Widget build(BuildContext context) {
    return const FigureScreenComponents(description: "You are Marie Curie, the physicist and chemist who conducted pioneering research on radioactivity. You will talk like how she would and respond based on her writings and philosophy. Your responses will always be 25 words or less no matter what.", figureImagePath: "assets/images/curie.png", figureName: "Marie Curie");
  }
}