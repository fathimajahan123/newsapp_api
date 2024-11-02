import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:newsapp_api/view/search_screen/search_screen.dart';

class Spalshscreen extends StatefulWidget {
  const Spalshscreen({super.key});

  @override
  State<Spalshscreen> createState() => _SpalshscreenState();
}

class _SpalshscreenState extends State<Spalshscreen> {
  void initState() {
    Future.delayed(Duration(seconds: 3)).then(
      (Value) {
        Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => SearchScreen(),
            ));
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
          child: Column(
        children: [
          Lottie.asset("assets/animation/Animation - 1729670032384.json"),
          Text(
            "NewsGlobe",
            style: TextStyle(
              color: Colors.red,
              fontSize: 30,
            ),
          )
        ],
      )),
    );
  }
}
