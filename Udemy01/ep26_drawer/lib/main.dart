import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'drawer Demo',
      home: Scaffold(
        appBar: AppBar(
          title: Text('drawer demo'),
        ),
        body: Center(
          child: Text('click at menu drawer'),
        ),
        drawer: Drawer(
          child: Column(
            children: <Widget>[
              Text('menu1:Sale'),
              Text('menu2:Stock'),
              Text('menu3:Setting')
            ],
          ),
        ),
      ),
    );
  }
}
