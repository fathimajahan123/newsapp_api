import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:newsapp_api/model/news_res_model.dart';
import 'package:newsapp_api/model/newsresmodel.dart';

class Searchscreen2Controller with ChangeNotifier {
  NewsresModel? newsresModel;
  bool isLoading = false;
  List newsArticles = [];

  Future<void> onSearch(String keyword) async {
    isLoading = true;
    notifyListeners();
    final url = Uri.parse(
        "https://newsapi.org/v2/everything?q=$keyword&apiKey=56919a0d21584f7b90efa4b3761da47b");
    try {
      var res = await http.get(url);
      if (res.statusCode == 200) {
        newsresModel = newsresModelFromJson(res.body);
        if (newsresModel != null) {
          newsArticles = newsresModel!.articles ?? [];
        }
      }
    } catch (e) {
      print(e);
    }
    isLoading = false;
    notifyListeners();
  }
}
