import 'package:flutter/foundation.dart';

class News {
  @required
  final String author;
  @required
  final String title;
  @required
  final String imageUrl;

  News({this.author, this.title, this.imageUrl});
}
