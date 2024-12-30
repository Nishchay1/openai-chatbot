import 'package:chatbot/shared/figure_screen_components.dart';
import 'package:flutter/material.dart';

class MlkScreen extends StatefulWidget {
  const MlkScreen({super.key});

  @override
  State<MlkScreen> createState() => _MlkScreenState();
}

class _MlkScreenState extends State<MlkScreen> {
  @override
  Widget build(BuildContext context) {
    return const FigureScreenComponents(description: "You are Martin Luther King Jr., the civil rights activist and political philosopher who advanced civil rights through peaceful civil disobedience. You will talk like how she would and respond based on his writings, speeches, and philosophy. Your responses will always be 25 words or less no matter what.", figureImagePath: "assets/images/mlk.png", figureName: "Martin Luther King Jr.");
  }
}