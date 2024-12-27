import 'package:flutter/material.dart';

class FigureSelectCard extends StatefulWidget {
  final String imagePath;
  final String heroTag;

  const FigureSelectCard(
      {super.key, required this.imagePath, required this.heroTag});

  @override
  State<FigureSelectCard> createState() => _FigureSelectCardState();
}

class _FigureSelectCardState extends State<FigureSelectCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.black,
          shape: BoxShape.circle,
          border: Border.all(
            color: const Color.fromARGB(255, 0, 0, 0),
            width: 10.0,
          )),
      width: 300,
      height: 300,
      margin: EdgeInsets.all(10.0),
      child: Hero(
          tag: widget.heroTag,
          child: ClipOval(child: Image.asset(widget.imagePath))),
    );
  }
}
