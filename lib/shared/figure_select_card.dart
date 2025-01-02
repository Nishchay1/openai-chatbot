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
        color: Colors.grey[300],
        borderRadius: BorderRadius.all(Radius.circular(50)),
        boxShadow: [
          BoxShadow(
            color: Colors.grey,
            offset: Offset(4.0, 4.0),
            blurRadius: 15.0,
            spreadRadius: 1.0
          ),
          BoxShadow(
            color: Colors.white,
            offset: Offset(-4.0, -4.0),
            blurRadius: 15.0,
            spreadRadius: 1.0
          ),
        ]
      ),
      child: Container(
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
      ),
    );
  }
}
