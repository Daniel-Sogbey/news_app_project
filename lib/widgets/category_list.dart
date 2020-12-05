import 'package:flutter/material.dart';

import '../models/category.dart';
import '../widgets/category_item.dart';

class CategoryList extends StatelessWidget {
  final List<Category> categories;

  CategoryList({this.categories});
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: 10.0, left: 10.0, bottom: 5.0),
      child: ListView.builder(
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemCount: categories.length,
        itemBuilder: (ctx, index) => CategoryItem(
          title: categories[index].title,
        ),
      ),
    );
  }
}
