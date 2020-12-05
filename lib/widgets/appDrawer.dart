import 'package:flutter/material.dart';

class AppDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Drawer(
        elevation: 6.0,
        child: Column(
          children: <Widget>[
            Container(
              height: 120,
              decoration: BoxDecoration(
                color: Colors.orangeAccent,
                border: Border.all(
                  width: 1,
                  style: BorderStyle.solid,
                  color: Colors.orangeAccent,
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 5.0),
              child: ListTile(
                onTap: () {
                  Navigator.of(context).pushNamed('/', arguments: 'us');
                },
                leading: Icon(
                  Icons.flag,
                  color: Colors.red,
                  size: 30.0,
                ),
                title: Text(
                  'United States',
                  style: TextStyle(
                    color: Colors.black54,
                    fontSize: 25.0,
                  ),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 5.0),
              child: ListTile(
                onTap: () {
                  Navigator.of(context).pushNamed('/', arguments: 'ng');
                },
                leading: Icon(
                  Icons.flag,
                  color: Colors.blue,
                  size: 30.0,
                ),
                title: Text(
                  'Nigeria',
                  style: TextStyle(
                    color: Colors.black54,
                    fontSize: 25.0,
                  ),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 5.0),
              child: ListTile(
                onTap: () {
                  Navigator.of(context).pushNamed('/', arguments: 'il');
                },
                leading: Icon(
                  Icons.flag,
                  color: Colors.pink,
                  size: 30.0,
                ),
                title: Text(
                  'Israel',
                  style: TextStyle(
                    color: Colors.black54,
                    fontSize: 25.0,
                  ),
                ),
              ),
            ),
            // Container(
            //   child: Text('United States'),
            // ),
            // Container(
            //   child: Text('United States'),
            // ),
          ],
        ),
      ),
    );
  }
}
