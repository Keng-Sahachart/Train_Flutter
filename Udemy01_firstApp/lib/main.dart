import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  String name = 'Sahachart Panx2';
  int i = 1000;
  String j = "300";
  int result = 0;

  Widget build(BuildContext context) {
    result = i + int.parse(j);

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Flutter App =>' + result.toString()),
          leading: IconButton(
            // ด้านซ้าย
            icon: Icon(
              Icons.menu,
              color: Colors.white,
            ),
            tooltip: "Menu",
            onPressed: null,
          ),
          actions: <Widget>[
            IconButton(
              icon: Icon(
                Icons.search,
                color: Colors.white,
              ),
              tooltip: "Search Data",
              onPressed: null,
            )
          ],
        ),
        body: Container(
          alignment: Alignment.center,
          child: Text('Hello World $name'),
        ),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.thumb_up),
          onPressed: () => {},
        ),
      ),
    );
  }
}
