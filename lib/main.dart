// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:newsapp_api/controller/news_details_screen_controller.dart';
import 'package:newsapp_api/controller/search_screen_controller.dart';
import 'package:newsapp_api/view/news_detail_screen/news_detail_screen.dart';
import 'package:newsapp_api/view/search_screen/search_screen.dart';
import 'package:newsapp_api/view/splash_screen/spalshscreen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (context) => SearchScreenController()),
          ChangeNotifierProvider(
              create: (context) => NewsDetailsScreenController())
        ],
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          home: Spalshscreen(),
        ));
  }
}
