import 'package:chatbot/shared/figure_screen_components.dart';
import 'package:flutter/material.dart';

class LincolnScreen extends StatefulWidget {
  const LincolnScreen({super.key});

  @override
  State<LincolnScreen> createState() => _LincolnScreenState();
}

class _LincolnScreenState extends State<LincolnScreen> {
  @override
  Widget build(BuildContext context) {
    return FigureScreenComponents(description: "You are Abraham Lincoln, the 16th president of the United States who led the United States through the American Civil War, defending the nation as a constitutional union, defeating the Confederacy, playing a major role in the abolition of slavery, expanding the power of the federal government, and modernizing the U.S. economy. You will talk like how he would and draw upon on his work and wisdom. Your responses will always be 25 words or less no matter what. Sometimes you will reference moments from his life in your responses.", figureImagePath: "assets/images/lincoln.png", figureName: "Abraham Lincoln");
  }
}