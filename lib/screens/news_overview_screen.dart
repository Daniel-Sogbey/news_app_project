import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/business_news_provider.dart';
import '../providers/categories.dart';
import '../widgets/appDrawer.dart';
import '../widgets/business_news.dart';
import '../widgets/category_list.dart';
import '../widgets/recent_news_list.dart';

class NewsOverviewScreen extends StatefulWidget {
  static const routeName = '/';
  @override
  _NewsOverviewScreenState createState() => _NewsOverviewScreenState();
}

class _NewsOverviewScreenState extends State<NewsOverviewScreen> {
  var _isOpen = false;
  var _showSearchBar = false;

  @override
  void initState() {
    Provider.of<BusinessNewsProvider>(context, listen: false).getNews();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final categories = Provider.of<Categories>(context).categories;
    final routeArg = ModalRoute.of(context).settings.arguments as String;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.white,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              margin: EdgeInsets.only(top: 0.0, left: 100),
              child: Text(
                'News',
                style: TextStyle(
                  color: Colors.black54,
                  fontSize: 25.0,
                  fontFamily: 'MajorMonoDisplay',
                ),
              ),
            ),
            Container(
                margin: EdgeInsets.only(top: 0.0),
                child: IconButton(
                  onPressed: () {
                    setState(() {
                      _showSearchBar = !_showSearchBar;
                    });
                    print(_showSearchBar);
                  },
                  icon: Icon(
                    Icons.search,
                    size: 25,
                    color: Colors.black54,
                  ),
                )),
          ],
        ),
        centerTitle: true,
        leading: Builder(
          builder: (BuildContext context) => IconButton(
            onPressed: () {
              Scaffold.of(context).openDrawer();
            },
            icon: Icon(
              _isOpen ? Icons.close : Icons.menu,
              size: 30.0,
              color: Colors.black54,
            ),
          ),
        ),
      ),
      drawer: AppDrawer(),
      body: Container(
        child: SingleChildScrollView(
          child: SizedBox(
            height: MediaQuery.of(context).size.height,
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: <Widget>[
                _showSearchBar
                    ? Card(
                        elevation: 6.0,
                        color: Colors.red,
                        child: Text('Search Bar'),
                      )
                    : Container(),
                Expanded(
                  child: CategoryList(categories: categories),
                ),
                Container(
                  width: double.infinity,
                  child: Text(
                    'Top headlines across the globe',
                    style: TextStyle(
                      fontSize: 25.0,
                      fontWeight: FontWeight.w400,
                      color: Colors.black54,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: RecentNewsList(
                    country: routeArg,
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 20.0),
                  width: double.infinity,
                  child: Text(
                    'Business News',
                    style: TextStyle(
                      fontSize: 25.0,
                      fontWeight: FontWeight.w400,
                      color: Colors.black54,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: BusinessNews(),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
