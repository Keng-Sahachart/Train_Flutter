import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Demo TapBar',
        home: DefaultTabController(
          length: 3,
          child: Scaffold(
              appBar: AppBar(
                title: Text('Demo TapBar'),
                bottom: TabBar(
                  // bottom : TabBar เป็นส่วนหนึ่งของ AppBar
                  tabs: <Tab>[
                    Tab(
                      icon: Icon(Icons.announcement),
                    ),
                    Tab(
                      icon: Icon(Icons.cake),
                    ),
                    Tab(
                      icon: Icon(Icons.cloud),
                    )
                  ],
                ),
              ),
              body: TabBarView(
                children: <Widget>[
                  Center(
                    child: Text('Page1'),
                  ),
                  Center(
                    child: Text('Page2'),
                  ),
                  Center(
                    child: Icon(
                      Icons.cloud,
                      color: Colors.red,
                      size: 250,
                    ),
                  ),
                ],
              )),
        ));
  }
}

/*
DefaultTabController อยู่เหนือสุด   -> Scaffold  --> AppBar
* Bottom : TabBar เป็นส่วนหนึ่งของ AppBar
* TabBarView ไม่ได้อยู่ใน AppBar แต่อยู่ใน body ของ Scaffold
* */
