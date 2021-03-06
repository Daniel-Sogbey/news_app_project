import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import './providers/business_news_provider.dart';
import './providers/categories.dart';
import './providers/recent_news_provider.dart';
import './screens/news_overview_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (ctx) => Categories(),
        ),
        ChangeNotifierProvider(
          create: (ctx) => RecentNewsProvider(),
        ),
        ChangeNotifierProvider(
          create: (ctx) => BusinessNewsProvider(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: NewsOverviewScreen(),
      ),
    );
  }
}
