import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/recent_news_provider.dart';

class RecentNewsList extends StatefulWidget {
  final String country;

  RecentNewsList({this.country});
  @override
  _RecentNewsListState createState() => _RecentNewsListState();
}

class _RecentNewsListState extends State<RecentNewsList> {
  @override
  void initState() {
    Provider.of<RecentNewsProvider>(context, listen: false)
        .usTopHeadlines(widget.country);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final recentNews = Provider.of<RecentNewsProvider>(context).recentNews;
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: recentNews.length,
      itemBuilder: (ctx, index) => Card(
        margin: EdgeInsets.symmetric(vertical: 5.0, horizontal: 10.0),
        elevation: 6.0,
        child: Column(
          children: <Widget>[
            recentNews[index].imageUrl == null
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
                : Container(
                    width: 250,
                    height: 120,
                    child: Image.network(
                      recentNews[index].imageUrl,
                      fit: BoxFit.cover,
                    ),
                  ),
            Container(
              width: 200,
              height: 92.6,
              child: recentNews[index].title.length > 30
                  ? Container(
                      color: Colors.white,
                      child: Container(
                        margin: EdgeInsets.only(left: 5.0),
                        child: Text(
                          recentNews[index].title.replaceRange(
                                30,
                                recentNews[index].title.length,
                                '...',
                              ),
                          style: TextStyle(
                            color: Colors.black54,
                            fontSize: 25.0,
                          ),
                        ),
                      ),
                    )
                  : Container(
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
          ],
        ),
      ),
    );
  }
}
