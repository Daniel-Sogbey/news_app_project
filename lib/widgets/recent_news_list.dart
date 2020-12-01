import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../models/recent_news.dart';

class RecentNewsList extends StatelessWidget {
  final List<RecentNews> recentNews = [
    RecentNews(
      title: 'Drone racing league is raising \$${50}million',
      imageUrl: 'https://static.dw.com/image/47219195_401.png',
    ),
    RecentNews(
      title: 'Drone racing league is raising \$${50}million',
      imageUrl:
          'https://q3p9g6n2.rocketcdn.me/wp-content/ml-loads/2014/02/media-shutterstock_111209576.png',
    ),
    RecentNews(
      title: 'Drone racing league is raising \$${50}million',
      imageUrl:
          'https://www.liberty.edu/champion/wp-content/uploads/2020/03/SPORTS-800x280.jpg',
    ),
    RecentNews(
      title: 'Drone racing league is raising \$${50}million',
      imageUrl:
          'https://www.unicef.org/ghana/sites/unicef.org.ghana/files/styles/hero_mobile/public/_DSC4078_1.jpg?itok=snv4vzoT',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: recentNews.length,
      itemBuilder: (ctx, index) => Container(
        width: 300,
        margin:
            EdgeInsets.only(bottom: 20.0, right: 15.0, left: 15.0, top: 15.0),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(30.0),
          child: Card(
            elevation: 6.0,
            child: Column(
              children: <Widget>[
                Expanded(
                  flex: 3,
                  child: Container(
                    height: 200,
                    width: 300,
                    child: Image.network(
                      recentNews[index].imageUrl,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    width: 300,
                    child: recentNews[index].title.length > 35
                        ? Container(
                            color: Colors.black26,
                            child: Text(
                              recentNews[index].title.replaceRange(
                                    35,
                                    recentNews[index].title.length,
                                    '...',
                                  ),
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 25.0,
                              ),
                            ),
                          )
                        : Container(
                            color: Colors.black26,
                            child: Text(
                              recentNews[index].title,
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 25.0,
                              ),
                            ),
                          ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
