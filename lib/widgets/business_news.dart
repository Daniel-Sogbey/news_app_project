import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/business_news_provider.dart';

class BusinessNews extends StatefulWidget {
  @override
  _BusinessNewsState createState() => _BusinessNewsState();
}

class _BusinessNewsState extends State<BusinessNews> {
  @override
  void initState() {
    Provider.of<BusinessNewsProvider>(context, listen: false).getBusinessNews;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final businessNews =
        Provider.of<BusinessNewsProvider>(context).getBusinessNews;
    return Container(
      margin: EdgeInsets.only(bottom: 10.0),
      alignment: Alignment.center,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: businessNews.length,
        itemBuilder: (ctx, index) => Card(
          margin: EdgeInsets.symmetric(vertical: 5.0, horizontal: 10.0),
          elevation: 6.0,
          child: Column(
            children: <Widget>[
              businessNews[index].imageUrl == null
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
                        businessNews[index].imageUrl,
                        fit: BoxFit.cover,
                      ),
                    ),
              Container(
                width: 200,
                height: 92.6,
                child: businessNews[index].title.length > 35
                    ? Container(
                        color: Colors.white,
                        child: Container(
                          margin: EdgeInsets.only(left: 5.0),
                          child: Text(
                            businessNews[index].title.replaceRange(
                                  35,
                                  businessNews[index].title.length,
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
                            businessNews[index].title,
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
    );
  }
}
