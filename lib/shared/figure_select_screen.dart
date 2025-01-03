import 'package:chatbot/theme/button.dart';
import 'package:flutter/material.dart';

class FigureSelectScreen extends StatefulWidget {
  final String imagePath;
  final String heroTag;
  final String screenName;
  final String figureName;
  final String figureInfo;
  const FigureSelectScreen(
      {super.key,
      required this.heroTag,
      required this.imagePath,
      required this.screenName,
      required this.figureName,
      required this.figureInfo});

  @override
  State<FigureSelectScreen> createState() => _FigureSelectScreenState();
}

class _FigureSelectScreenState extends State<FigureSelectScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Select Figure"),
          centerTitle: true,
          titleTextStyle: TextStyle(fontSize: 24, color: Colors.black),
        ),
        body: SafeArea(
          child: Column(
            children: [
              Hero(
                  tag: widget.heroTag,
                  child: ClipOval(
                      child: Image.asset(
                          width: 200, height: 200, widget.imagePath))),
              Text(style: TextStyle(fontSize: 36), widget.figureName),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  child: SingleChildScrollView(
                      child: Text(
                          style: TextStyle(fontSize: 20), widget.figureInfo)),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 8.0),
                    child: SizedBox(
                      height: 50,
                      child: ElevatedButton(
                        style: primaryButton,
                        onPressed: () =>
                            {Navigator.pushNamed(context, widget.screenName)},
                        child: Text("Select"),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}
