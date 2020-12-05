import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

import '../models/recent_news.dart';

class RecentNewsProvider with ChangeNotifier {
  List<RecentNews> _recentNews = [];

  List<RecentNews> get recentNews {
    return [..._recentNews];
  }

  Future<List<RecentNews>> usTopHeadlines(String country) async {
    final url =
        'https://newsapi.org/v2/top-headlines?country=$country&apiKey=d6d61e8cb2634b43923da78a9a50d230';

    try {
      final response = await http.get(url);

      final recentNews = json.decode(response.body);

      var newsData = recentNews['articles'][0];
      print(newsData['source']['name']);

      for (int i = 0; i < 19; i++) {
        var newsData = recentNews['articles'][i];

        _recentNews.add(
          RecentNews(
            source: newsData['source']['name'],
            title: newsData['title'],
            imageUrl: newsData['urlToImage'],
          ),
        );
      }
      notifyListeners();
    } catch (error) {
      print(error);
    }
    print('${_recentNews[0].title} loadedNews');
    return _recentNews;
  }
}
