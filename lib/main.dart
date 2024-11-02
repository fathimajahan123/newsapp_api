// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:newsapp_api/controller/news_details_screen_controller.dart';
import 'package:newsapp_api/controller/search_screen_controller.dart';
import 'package:newsapp_api/controller/searchscreen2_controller.dart';
import 'package:newsapp_api/view/news_detail_screen/news_detail_screen.dart';
import 'package:newsapp_api/view/personalize_screen/personalize_screen.dart';
import 'package:newsapp_api/view/profile_screen/profile_screen.dart';
import 'package:newsapp_api/view/saved_news_screen/saved_news_screen.dart';
import 'package:newsapp_api/view/search_screen/search_screen.dart';
import 'package:newsapp_api/view/search_screen/search_screen2.dart';
import 'package:newsapp_api/view/splash_screen/spalshscreen.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();

  var box = await Hive.openBox("saved");

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
              create: (context) => NewsDetailsScreenController()),
          ChangeNotifierProvider(create: (context) => Searchscreen2Controller())
        ],
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          home: Spalshscreen(),
        ));
  }
}
