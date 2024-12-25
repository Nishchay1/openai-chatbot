import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var screenList = [
    '/buddha_screen',
    '/aristotle_screen',
    '/confucius_screen',
    '/lincoln_screen',
    '/caesar_screen'
  ];
  var imageList = [
    'assets/images/buddha.png',
    'assets/images/aristotle.png',
    'assets/images/confucius.png',
    'assets/images/lincoln.png',
    'assets/images/caesar.png'
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Select Figure"),
          centerTitle: true,
          backgroundColor: Colors.black,
          titleTextStyle: TextStyle(color: Colors.white, fontSize: 24),
        ),
        body: Container(
          color: Colors.black,
          child: ListView.builder(
              itemCount: imageList.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, screenList[index]);
                    },
                    child: Card(
                      color: Colors.black,
                      margin: EdgeInsets.all(8.0),
                      child: Image.asset(imageList[index]),
                    ));
              }),
        ));
  }
}
