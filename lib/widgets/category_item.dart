import 'package:flutter/material.dart';

class CategoryItem extends StatelessWidget {
  final String title;

  CategoryItem({this.title});
  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashColor: Theme.of(context).primaryColor,
      borderRadius: BorderRadius.circular(20.0),
      onTap: () {},
      child: Container(
        height: 30.0,
        margin: EdgeInsets.all(15.0),
        padding: EdgeInsets.all(5.0),
        child: Text(
          title,
          style: TextStyle(
            color: Colors.grey,
            fontSize: 22.0,
          ),
        ),
      ),
    );
  }
}
