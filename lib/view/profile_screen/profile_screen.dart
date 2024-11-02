// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:newsapp_api/view/personalize_screen/personalize_screen.dart';
import 'package:newsapp_api/view/saved_news_screen/saved_news_screen.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("profile"),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          children: [
            CircleAvatar(
              radius: 50,
            ),
            Divider(),
            Text(
              "----Personalize----",
              style: TextStyle(color: Colors.red),
            ),
            SizedBox(
              height: 10,
            ),
            InkWell(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (conext) => SavedNewsScreen()));
              },
              child: Row(
                children: [
                  Icon(
                    Icons.bookmark,
                    color: Colors.red,
                  ),
                  Text("Saved news"),
                  Spacer(),
                  Icon(Icons.arrow_right)
                ],
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Divider(),
            SizedBox(
              height: 10,
            ),
            InkWell(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (conext) => PersonalizeScreen()));
              },
              child: Row(
                children: [
                  Icon(Icons.star),
                  Text("Choose your interests"),
                  Spacer(),
                  Icon(Icons.arrow_right)
                ],
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Divider(),
            SizedBox(
              height: 10,
            ),
            InkWell(
              onTap: () {
                showModalBottomSheet(
                    context: context,
                    builder: (context) {
                      return Languageselection();
                    });
              },
              child: Row(
                children: [
                  Icon(Icons.language),
                  Text("Change language"),
                  Spacer(),
                  Icon(Icons.arrow_right)
                ],
              ),
            ),
            SizedBox(
              height: 10,
            ),
          ],
        ),
      ),
    );
  }
}

class Languageselection extends StatelessWidget {
  const Languageselection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            'Select Language',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 10),
        ],
      ),
    );
  }
}
