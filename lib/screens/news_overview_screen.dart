import 'package:flutter/material.dart';

import '../models/category.dart';
import '../widgets/category_list.dart';
import '../widgets/recent_news_list.dart';

class NewsOverviewScreen extends StatefulWidget {
  @override
  _NewsOverviewScreenState createState() => _NewsOverviewScreenState();
}

class _NewsOverviewScreenState extends State<NewsOverviewScreen> {
  List<Category> categories = [
    Category(
      title: 'Business',
    ),
    Category(
      title: 'Entertainment',
    ),
    Category(
      title: 'Sports',
    ),
    Category(
      title: 'Education',
    ),
    Category(
      title: 'World',
    ),
    Category(
      title: 'Politics',
    ),
    Category(
      title: 'Tech',
    ),
  ];

  var _isOpen = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.white,
        title: Container(
          margin: EdgeInsets.only(top: 0.0),
          child: Text(
            'News',
            style: TextStyle(
              color: Colors.black54,
              fontSize: 25.0,
            ),
          ),
        ),
        centerTitle: true,
        leading: Builder(
          builder: (BuildContext context) => IconButton(
            onPressed: () {
              // Scaffold.of(context).openDrawer();
            },
            icon: Icon(
              _isOpen ? Icons.close : Icons.menu,
              size: 30.0,
              color: Colors.black54,
            ),
          ),
        ),
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: CategoryList(categories: categories),
          ),
          Expanded(
            child: RecentNewsList(),
          ),
        ],
      ),
    );
  }
}
