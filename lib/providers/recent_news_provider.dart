import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

import '../models/recent_news.dart';

class RecentNewsProvider with ChangeNotifier {
  List<RecentNews> _recentNews = [];

  List<RecentNews> get recentNews {
    return [..._recentNews];
  }

  Future<List<RecentNews>> usTopHeadlines() async {
    const usUrl =
        'https://newsapi.org/v2/top-headlines?country=us&apiKey=d6d61e8cb2634b43923da78a9a50d230';
    const ngUrl =
        'https://newsapi.org/v2/top-headlines?country=ng&apiKey=d6d61e8cb2634b43923da78a9a50d230';
    try {
      final usResponse = await http.get(usUrl);
      // final ngResponse = await http.get(ngUrl);

      final usRecentNews = json.decode(usResponse.body);
      // final ngRecentNews = json.decode(usResponse.body);

      for (int i = 0; i < 15; i++) {
        var newsData = usRecentNews['articles'][i];

        _recentNews.add(
          RecentNews(
            source: newsData['source']['name'],
            title: newsData['title'],
            imageUrl: newsData['urlToImage'],
          ),
        );
      }
      // for (int i = 0; i < 5; i++) {
      //   var newsData = ngRecentNews['articles'][i];
      //
      //   _recentNews.add(
      //     RecentNews(
      //       source: newsData['source']['name'],
      //       title: newsData['title'],
      //       imageUrl: newsData['urlToImage'],
      //     ),
      //   );
      // }
      notifyListeners();
    } catch (error) {
      print(error);
    }
    print('${_recentNews[0].title} loadedNews');
    return _recentNews;
  }
}
