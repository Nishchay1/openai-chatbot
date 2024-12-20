import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Select Figure"),
          centerTitle: true,
        ),
        body: Column(
          children: [
            ElevatedButton(onPressed: (){
              Navigator.pushNamed(context, '/buddha_screen');
            }, child: Text("Buddha")),
            ElevatedButton(onPressed: (){
              Navigator.pushNamed(context, '/aristotle_screen');
            }, child: Text("Aristotle")),
            ElevatedButton(onPressed: (){
              Navigator.pushNamed(context, '/confucius_screen');
            }, child: Text("Confucius")),
          ],
        )
    );
  }
}
