import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:newsapp_api/model/news_res_model.dart';

class SearchScreenController with ChangeNotifier {
  NewsResModel? newsResModel;
  List<Article> newsarticles = [];
  bool isLoading = false;
  int selectednewsCategoryindex = 0;
  bool isAllnewsLoading = false;
  List<NewsResModel> listofNewsarticles = [];
  List newscategorylist = [
    "Top",
    "Business",
    "Entertainment",
    "Health",
    "Sports",
    "Technology"
  ];

  String selectedlanuage = "en";

  Future<void> fetchNews(String language) async {
    final response = await http.get(Uri.parse(
        "https://newsapi.org/v2/everything?q=$language&langauge=$selectedlanuage&apiKey=56919a0d21584f7b90efa4b3761da47b"));
  }

  void updatelanguage(String language) {
    selectedlanuage = language;
    fetchNews(language);
  }

  SearchScreenController() {
    onSearch(null, "Top");
  }

  Future<void> onSearch(String? keyword, String? category) async {
    isLoading = true;

    notifyListeners();

    var url = Uri.parse(
        "https://newsapi.org/v2/everything?q=$keyword&apiKey=56919a0d21584f7b90efa4b3761da47b");

    if (category != null && category == "Top") {
      url = Uri.parse(
          "https://newsapi.org/v2/top-headlines?country=us&apiKey=56919a0d21584f7b90efa4b3761da47b");
    } else if (keyword != null && keyword.isNotEmpty) {
      url = Uri.parse(
          "https://newsapi.org/v2/everything?q=$keyword&apiKey=56919a0d21584f7b90efa4b3761da47b");
    } else if (category != null && category == "Business") {
      url = Uri.parse(
          "https://newsapi.org/v2/everything?q=business&from=2024-09-23&sortBy=publishedAt&apiKey=56919a0d21584f7b90efa4b3761da47b");
    } else if (category != null && category == "Entertainment") {
      url = Uri.parse(
          "https://newsapi.org/v2/everything?q=Entertainment&from=2024-09-23&sortBy=publishedAt&apiKey=56919a0d21584f7b90efa4b3761da47b");
    } else if (category != null && category == "Health") {
      url = Uri.parse(
          "https://newsapi.org/v2/everything?q=Health&from=2024-09-23&sortBy=publishedAt&apiKey=56919a0d21584f7b90efa4b3761da47b");
    } else if (category != null && category == "Sports") {
      url = Uri.parse(
          "https://newsapi.org/v2/everything?q=Sports&from=2024-09-23&sortBy=publishedAt&apiKey=56919a0d21584f7b90efa4b3761da47b");
    } else if (category != null && category == "Technology") {
      url = Uri.parse(
          "https://newsapi.org/v2/everything?q=Technology&from=2024-09-23&sortBy=publishedAt&apiKey=56919a0d21584f7b90efa4b3761da47b");
    }

    try {
      var res = await http.get(url);
      if (res.statusCode == 200) {
        newsResModel = singlenewsResModelFromJson(res.body);
        if (newsResModel != null) {
          log(category.toString());
          newsarticles = newsResModel!.articles!;
        }
      }
    } catch (e) {
      print(e);
    }
    isLoading = false;
    notifyListeners();
  }

  void onNewsCategoryslection(int index) {
    selectednewsCategoryindex = index;
    String selectedcategory = newscategorylist[index];
    onSearch(null, selectedcategory);
    notifyListeners();
  }
}
