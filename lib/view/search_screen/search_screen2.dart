// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:newsapp_api/controller/search_screen_controller.dart';
import 'package:newsapp_api/controller/searchscreen2_controller.dart';
import 'package:newsapp_api/view/news_detail_screen/news_detail_screen.dart';
import 'package:provider/provider.dart';

class SearchScreen2 extends StatefulWidget {
  const SearchScreen2({super.key});

  @override
  State<SearchScreen2> createState() => _SearchScreen2State();
}

class _SearchScreen2State extends State<SearchScreen2> {
  TextEditingController searchcontroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final searchprovider = context.watch<Searchscreen2Controller>();
    return Scaffold(
      body: Column(
        children: [
          SearchBar(
            controller: searchcontroller,
            leading: IconButton(
                onPressed: () {
                  context.read<Searchscreen2Controller>().onSearch(
                        searchcontroller.text,
                      );
                },
                icon: Icon(Icons.search)),
            onChanged: (value) {
              if (value.isNotEmpty) {
                context.read<Searchscreen2Controller>().onSearch(
                      searchcontroller.text,
                    );
              }
            },
          ),
          Expanded(
            child: Builder(builder: (context) {
              if (searchprovider.isLoading) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              } else if (searchprovider.newsArticles.isEmpty) {
                return Center(
                  child: Text("no result"),
                );
              } else {
                return ListView.separated(
                    itemBuilder: (context, index) => Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: InkWell(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => NewsDetailScreen(
                                            title: searchprovider
                                                .newsArticles[index].title
                                                .toString(),
                                            imageUrl: searchprovider
                                                .newsArticles[index].urlToImage
                                                .toString(),
                                            description: searchprovider
                                                .newsArticles[index].description
                                                .toString(),
                                            content: searchprovider
                                                .newsArticles[index].content
                                                .toString(),
                                            author: searchprovider
                                                .newsArticles[index].author
                                                .toString(),
                                            newsId: '',
                                          )));
                            },
                            child: Container(
                              width: double.infinity,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: Colors.grey),
                              child: Column(
                                children: [
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(10),
                                    child: Image.network(
                                      searchprovider
                                          .newsArticles[index].urlToImage
                                          .toString(),
                                    ),
                                  ),
                                  Text(
                                    searchprovider.newsArticles[index].title
                                        .toString(),
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                    separatorBuilder: (context, index) => SizedBox(
                          height: 10,
                        ),
                    itemCount: searchprovider.newsArticles.length);
              }
            }),
          )
        ],
      ),
    );
  }
}
