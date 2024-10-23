import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:newsapp_api/model/news_res_model.dart';

class NewsDetailsScreenController with ChangeNotifier {
  NewsResModel? newsdetail;
  bool isLoading = false;
  getsinglenewsdetail(String newsid) async {
    final url = Uri.parse(
        "https://newsapi.org/v2/everything?q=$newsid&apiKey=56919a0d21584f7b90efa4b3761da47b");
    isLoading = true;
    notifyListeners();

    try {
      var response = await http.get(url);
      if (response.statusCode == 200) {
        newsdetail = singlenewsResModelFromJson(response.body);
      }
    } catch (e) {
      print(e);
    }
    isLoading = false;
    notifyListeners();
  }
}
