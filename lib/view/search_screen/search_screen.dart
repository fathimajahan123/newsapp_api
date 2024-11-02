// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:newsapp_api/controller/search_screen_controller.dart';
import 'package:newsapp_api/model/news_res_model.dart';
import 'package:newsapp_api/view/news_detail_screen/news_detail_screen.dart';
import 'package:newsapp_api/view/profile_screen/profile_screen.dart';
import 'package:newsapp_api/view/search_screen/search_screen2.dart';
import 'package:provider/provider.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<SearchScreen> {
  TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final searchscreenprovider = context.watch<SearchScreenController>();
    return Scaffold(
      appBar: AppBar(
        leading: InkWell(
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => SearchScreen2()));
            },
            child: Icon(Icons.search)),
        actions: [
          InkWell(
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => ProfileScreen()));
            },
            child: CircleAvatar(
                radius: 15,
                backgroundColor: Colors.black,
                child: Icon(
                  Icons.person_4_sharp,
                  color: Colors.white,
                )),
          ),
          SizedBox(
            width: 10,
          )
        ],
        centerTitle: true,
        title: Text(
          "NewsGlobe",
          style: TextStyle(
              color: Colors.red, fontWeight: FontWeight.bold, fontSize: 25),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        child: Column(
          children: [
            SizedBox(
              height: 10,
            ),
            SizedBox(
              child: CarouselSlider.builder(
                  itemCount: searchscreenprovider.newsarticles.length,
                  itemBuilder: (context, index, realIndex) {
                    final article = searchscreenprovider.newsarticles[index];
                    return InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => NewsDetailScreen(
                              title: article.title.toString(),
                              imageUrl: article.urlToImage.toString(),
                              description: article.description.toString(),
                              content: article.content.toString(),
                              author: article.author.toString(),
                              newsId: '',
                            ),
                          ),
                        );
                      },
                      child: Stack(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(20),
                            child: Image.network(
                              article.urlToImage.toString(),
                              fit: BoxFit.cover,
                            ),
                          ),
                          Positioned(
                              child: Text(
                            article.title.toString(),
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                                fontSize: 20),
                          ))
                        ],
                      ),
                    );
                  },
                  options: CarouselOptions(
                    height: 200,
                    aspectRatio: 16 / 9,
                    viewportFraction: 0.8,
                    initialPage: 0,
                    enableInfiniteScroll: true,
                    reverse: false,
                    autoPlay: true,
                    autoPlayInterval: Duration(seconds: 3),
                    autoPlayAnimationDuration: Duration(milliseconds: 800),
                    autoPlayCurve: Curves.fastOutSlowIn,
                    enlargeCenterPage: true,
                    enlargeFactor: 0.3,
                    scrollDirection: Axis.horizontal,
                  )),
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: List.generate(
                    searchscreenprovider.newscategorylist.length,
                    (index) => Padding(
                          padding: const EdgeInsets.all(2.0),
                          child: InkWell(
                            onTap: () {
                              searchscreenprovider
                                  .onNewsCategoryslection(index);
                              searchscreenprovider
                                  .onNewsCategoryslection(index);
                              context.read<SearchScreenController>().onSearch(
                                  null,
                                  searchscreenprovider.newscategorylist[index]);
                            },
                            child: Container(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 20, vertical: 5),
                              decoration: BoxDecoration(
                                  color: searchscreenprovider
                                              .selectednewsCategoryindex ==
                                          index
                                      ? Colors.blue
                                      : Colors.grey.shade300,
                                  borderRadius: BorderRadius.circular(10)),
                              child: Row(
                                children: [
                                  Icon(
                                    Icons.search,
                                    size: 20,
                                  ),
                                  Text(
                                    searchscreenprovider
                                        .newscategorylist[index],
                                    style: TextStyle(color: Colors.black),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        )),
              ),
            ),
            Expanded(
              child: Builder(builder: (context) {
                final newsarticles = searchscreenprovider.newsarticles;

                if (searchscreenprovider.isLoading) {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                } else if (newsarticles.isEmpty) {
                  return Center(
                    child: Text("no result"),
                  );
                } else {
                  bool isTopCategory = searchscreenprovider.newscategorylist[
                          searchscreenprovider.selectednewsCategoryindex] ==
                      "Top";
                  if (isTopCategory) {
                    return ListView.builder(
                        itemCount: newsarticles.length,
                        itemBuilder: (context, index) {
                          final newsArticle =
                              searchscreenprovider.newsarticles[index];
                          return InkWell(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (contetx) => NewsDetailScreen(
                                            title: newsArticle.title.toString(),
                                            imageUrl: newsArticle.urlToImage
                                                .toString(),
                                            description: newsArticle.description
                                                .toString(),
                                            content:
                                                newsArticle.content.toString(),
                                            author:
                                                newsArticle.author.toString(),
                                            newsId: '',
                                          )));
                            },
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                children: [
                                  Row(
                                    children: [
                                      ClipRRect(
                                        borderRadius: BorderRadius.circular(10),
                                        child: Image.network(
                                          newsArticle.urlToImage.toString(),
                                          fit: BoxFit.cover,
                                          height: 50,
                                          width: 50,
                                        ),
                                      ),
                                      SizedBox(
                                        width: 5,
                                      ),
                                      Expanded(
                                          child: Text(
                                        newsArticle.title ?? "no title",
                                        maxLines: 2,
                                        overflow: TextOverflow.ellipsis,
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 20),
                                      ))
                                    ],
                                  ),
                                  Divider()
                                ],
                              ),
                            ),
                          );
                        });
                  } else {
                    return MasonryGridView.count(
                        crossAxisCount: 2,
                        crossAxisSpacing: 5,
                        mainAxisSpacing: 5,
                        itemCount: searchscreenprovider.newsarticles.length,
                        itemBuilder: (context, index) => InkWell(
                              onTap: () {
                                final selectedNews =
                                    searchscreenprovider.newsarticles[index];

                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => NewsDetailScreen(
                                      title: selectedNews.title.toString(),
                                      imageUrl:
                                          selectedNews.urlToImage.toString(),
                                      description:
                                          selectedNews.description.toString(),
                                      author: selectedNews.author.toString(),
                                      content: selectedNews.content.toString(),
                                      newsId: '',
                                    ),
                                  ),
                                );
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                    color: Colors.grey.shade300,
                                    borderRadius: BorderRadius.circular(5)),
                                padding: EdgeInsets.symmetric(
                                    horizontal: 10, vertical: 10),
                                child: Column(
                                  children: [
                                    Text(
                                      searchscreenprovider
                                          .newsarticles[index].title
                                          .toString(),
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 20),
                                    ),
                                    Image.network(searchscreenprovider
                                        .newsarticles[index].urlToImage
                                        .toString()),
                                    // CachedNetworkImage(
                                    //   imageUrl: searchscreenprovider
                                    //       .newsarticles[index].description
                                    //       .toString(),
                                    //   placeholder: (context, url) =>
                                    //       CircularProgressIndicator(),
                                    //   errorWidget: (context, url, error) =>
                                    //       Icon(Icons.error),
                                    // ),
                                    Text(
                                      searchscreenprovider
                                          .newsarticles[index].description
                                          .toString(),
                                      style: TextStyle(fontSize: 15),
                                    ),
                                    Text(
                                      searchscreenprovider
                                          .newsarticles[index].author
                                          .toString(),
                                      style: TextStyle(color: Colors.red),
                                    ),
                                  ],
                                ),
                              ),
                            ));
                  }
                }
              }),
            )
          ],
        ),
      ),
    );
  }
}
