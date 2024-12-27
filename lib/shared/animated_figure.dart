import 'package:flutter/material.dart';

class AnimatedFigure extends StatefulWidget {
  final AnimationController controller;

  final String imagePath;

  const AnimatedFigure({super.key, required this.controller, required this.imagePath});

  @override
  State<AnimatedFigure> createState() => _AnimatedFigureState();
}

class _AnimatedFigureState extends State<AnimatedFigure> {
  @override
  Widget build(BuildContext context) {
    return Center(
        child: ScaleTransition(
      scale: Tween<double>(begin: 0.8, end: 1.0).animate(
        CurvedAnimation(
          parent: widget.controller,
          curve: Curves.easeInOut,
        ),
      ),
      child: ClipOval(
        child: Image.asset(
          widget.imagePath,
        ),
      ),
    ));
  }
}
