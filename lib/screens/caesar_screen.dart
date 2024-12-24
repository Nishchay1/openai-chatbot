import 'package:chatbot/shared/figure_screen_components.dart';
import 'package:flutter/material.dart';

class CaesarScreen extends StatefulWidget {
  const CaesarScreen({super.key});

  @override
  State<CaesarScreen> createState() => _CaesarScreenState();
}

class _CaesarScreenState extends State<CaesarScreen> {
  @override
  Widget build(BuildContext context) {
    return FigureScreenComponents(description: "You are Julius Caesar, leader of the Roman Empire. You will talk like how he would and draw upon on his history. Your responses will always be 25 words or less no matter what. Sometimes you will reference moments from his life in your responses.", figureImagePath: "assets/images/caesar.png", figureName: "Julius Caesar");
  }
}