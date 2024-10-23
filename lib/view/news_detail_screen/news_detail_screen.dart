// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:newsapp_api/controller/news_details_screen_controller.dart';
import 'package:newsapp_api/main.dart';
import 'package:provider/provider.dart';

class NewsDetailScreen extends StatefulWidget {
  const NewsDetailScreen(
      {super.key,
      required this.title,
      required this.imageUrl,
      required this.description,
      required this.content,
      required this.author});

  final String title;
  final String imageUrl;
  final String content;

  final String description;
  final String author;

  @override
  State<NewsDetailScreen> createState() => _NewsDetailScreenState();
}

class _NewsDetailScreenState extends State<NewsDetailScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final newsDetailScreenProvider =
        context.watch<NewsDetailsScreenController>();
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: newsDetailScreenProvider.isLoading
              ? Center(child: CircularProgressIndicator())
              : Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.title,
                        style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                            color: Colors.red.shade800),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Image.network(widget.imageUrl),
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                        widget.description,
                        style: TextStyle(
                            fontSize: 14, color: Colors.blue.shade800),
                      ),
                      Text(
                        widget.content,
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.black,
                        ),
                        textAlign: TextAlign.justify,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text(
                            widget.author,
                            style: TextStyle(color: Colors.blue, fontSize: 15),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
        ),
      ),
    );
  }
}
