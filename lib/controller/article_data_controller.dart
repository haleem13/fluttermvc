import 'dart:async';
import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:fluttermvcsample/models/article.dart';
import 'package:http/http.dart' as http;

class ArticleDataService extends ChangeNotifier {
  String articleUrl =
      'https://newsapi.org/v2/everything?q=besiktas&page=1&apiKey=90f78b5e459f4557a6d285161db89387';

  bool _isLoading = true;
  bool get isLoading => _isLoading;

  List<Articles>? articles = [];

  Future<List<Articles>?> fetchArticles({String query = ''}) async {
    final result = await http.get(Uri.parse(articleUrl)).catchError((e) {
      print('Error Fetching articles');
    });

    if (result.statusCode == 200) {
      Map<String, dynamic> data = json.decode(result.body);
      var _articles = data["articles"];
      if (_articles != null) {
        if (query != '') {
          articles = News.fromJson(data).articles;
          articles = articles!.where((article) {
            final titleLower = article.title!.toLowerCase();
            return titleLower.contains(query);
          }).toList();
        } else {
          articles = News.fromJson(data).articles;
        }
      }
      _isLoading = false;
      notifyListeners();
      return articles;
    } else {
      _isLoading = false;
      notifyListeners();
      throw Exception('Error - ${result.statusCode}');
    }
  }
}
