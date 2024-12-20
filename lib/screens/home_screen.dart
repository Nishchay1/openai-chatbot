import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var screenList = ['/buddha_screen', '/aristotle_screen', '/confucius_screen'];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Select Figure"),
          centerTitle: true,
        ),
        body: Center(
            child: SizedBox(
                height: 500,
                child: CarouselView(
                  onTap: (index) {
                    Navigator.pushNamed(context, screenList[index]);
                  },
                  itemSnapping: true,
                  itemExtent: MediaQuery.sizeOf(context).width - 40,
                  children: [
                    Image.asset('assets/images/buddha.png'),
                    Image.asset('assets/images/aristotle.png'),
                    Image.asset('assets/images/confucius.png'),
                  ],
                ))));
  }
}
