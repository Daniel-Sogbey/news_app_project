import 'package:flutter/material.dart';

class RecentNews {
  @required
  final String title;
  @required
  final String imageUrl;
  final DateTime date;

  RecentNews({this.title, this.imageUrl, this.date});
}
