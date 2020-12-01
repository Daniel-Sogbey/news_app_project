import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/recent_news_provider.dart';

class RecentNewsList extends StatefulWidget {
  @override
  _RecentNewsListState createState() => _RecentNewsListState();
}

class _RecentNewsListState extends State<RecentNewsList> {
  @override
  void initState() {
    Provider.of<RecentNewsProvider>(context, listen: false).usTopHeadlines();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final recentNews = Provider.of<RecentNewsProvider>(context).recentNews;
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
                    child: recentNews[index].imageUrl == null
                        ? Container(
                            margin: EdgeInsets.all(50.0),
                            child: Text(
                              'No Image Found',
                              style: TextStyle(
                                fontSize: 20.0,
                                color: Colors.black54,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          )
                        : Image.network(
                            recentNews[index].imageUrl,
                            fit: BoxFit.cover,
                          ),
                  ),
                ),
                Expanded(
                  child: Container(
                    width: 300,
                    child: recentNews[index].title.length > 45
                        ? Container(
                            color: Colors.black26,
                            child: Container(
                              margin: EdgeInsets.only(left: 5.0),
                              child: Text(
                                recentNews[index].title.replaceRange(
                                      45,
                                      recentNews[index].title.length,
                                      '...',
                                    ),
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 25.0,
                                ),
                              ),
                            ),
                          )
                        : Container(
                            color: Colors.black26,
                            child: Container(
                              margin: EdgeInsets.only(left: 5.0),
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
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
