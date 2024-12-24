import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var screenList = ['/buddha_screen', '/aristotle_screen', '/confucius_screen', '/lincoln_screen'];
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
          child: Center(
                  child: CarouselView(
                    backgroundColor: Colors.black,
                    onTap: (index) {
                      Navigator.pushNamed(context, screenList[index]);
                    },
                    itemSnapping: true,
                    itemExtent: MediaQuery.sizeOf(context).width - 40,
                    shrinkExtent: 250,
                    children: [
                      Image.asset('assets/images/buddha.png',),
                      Image.asset('assets/images/aristotle.png',),
                      Image.asset('assets/images/confucius.png',),
                      Image.asset('assets/images/lincoln.png'),
                      Image.asset('assets/images/caesar.png'),
                    ],
                  )),
        ));
  }
}
