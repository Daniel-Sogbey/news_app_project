import 'package:flutter/material.dart';

import '../models/category.dart';

class Categories with ChangeNotifier {
  List<Category> _categories = [
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

  List<Category> get categories {
    return [..._categories];
  }
}
