import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

import '../models/news.dart';

class BusinessNewsProvider with ChangeNotifier {
  List<News> _businessNews = [
    // News(
    //   title: 'Drone racing league is raising \$${50}million',
    //   author: 'Daniel Aniel ',
    //   imageUrl: 'https://static.dw.com/image/47219195_401.png',
    //   description: 'aaaaaaaaaaaaaaaaaaaaaaaaaaaaa',
    // ),
    // News(
    //   title: 'Drone racing league is raising \$${50}million',
    //   author: 'Daniel Aniel ',
    //   imageUrl: 'https://static.dw.com/image/47219195_401.png',
    //   description: 'aaaaaaaaaaaaaaaaaaaaaaaaaaaaa',
    // ),
    // News(
    //   title: 'Drone racing league is raising \$${50}million',
    //   author: 'Daniel Aniel ',
    //   imageUrl: 'https://static.dw.com/image/47219195_401.png',
    //   description: 'aaaaaaaaaaaaaaaaaaaaaaaaaaaaa',
    // ),
    // News(
    //   title: 'Drone racing league is raising \$${50}million',
    //   author: 'Daniel Aniel ',
    //   imageUrl: 'https://static.dw.com/image/47219195_401.png',
    //   description: 'aaaaaaaaaaaaaaaaaaaaaaaaaaaaa',
    // ),
  ];

  List<News> get getBusinessNews {
    return [..._businessNews];
  }

  Future<List<News>> getNews() async {
    const url =
        'https://newsapi.org/v2/top-headlines?country=us&category=business&apiKey=d6d61e8cb2634b43923da78a9a50d230';
    try {
      final response = await http.get(url);

      final newsData = json.decode(response.body);

      for (int i = 1; i < 19; i++) {
        var newsArticle = newsData['articles'][i];

        _businessNews.add(
          News(
              author: newsArticle['author'],
              title: newsArticle['title'],
              imageUrl: newsArticle['urlToImage']),
        );
      }
      notifyListeners();
      print(response.body);
      print(newsData['totalResults']);
    } catch (error) {
      throw error;
    }

    return _businessNews;
  }
}
