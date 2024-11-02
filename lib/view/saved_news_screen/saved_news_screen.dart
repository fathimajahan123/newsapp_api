// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:newsapp_api/model/newsresmodel.dart';

class SavedNewsScreen extends StatefulWidget {
  const SavedNewsScreen({super.key});

  @override
  State<SavedNewsScreen> createState() => _SavedNewsScreenState();
}

class _SavedNewsScreenState extends State<SavedNewsScreen> {
  late Box savedBox;
  List<Article> savedarticles = [];

  @override
  void initState() {
    super.initState();
    savedBox = Hive.box("saved");
    getsavedarticle();
  }

  void getsavedarticle() {
    savedarticles.clear();
    savedBox.toMap().forEach((key, value) {
      if (value is Article) {
        savedarticles.add(value);
      }
    });
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text("Saved Stories"),
        ),
        body: savedarticles.isEmpty
            ? Center(
                child: Text("No saved artiticles"),
              )
            : ListView.builder(
                itemCount: savedarticles.length,
                itemBuilder: (context, index) {
                  final article = savedarticles[index];
                  return Container(
                    padding: EdgeInsets.all(10),
                    child: Row(
                      children: [
                        Text(
                          article.title ?? "",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        Spacer(),
                        ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Image.network(
                            article.urlToImage ?? "",
                            width: 100,
                          ),
                        )
                      ],
                    ),
                  );
                }));
  }
}
