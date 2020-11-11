// import 'dart:ui';

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
          title: Text('drawer demo ..'),
        ),
        body: Center(
          child: Text('click at menu drawer'),
        ),
        drawer: Drawer(
          child: Column(
            children: <Widget>[
              DrawerHeader(
                //ถ้าไม่มี DrawerHeader เมนู จะกินพื้นที่ ด้านบน
                child: Text('DrawerHeader'),
                decoration: BoxDecoration(color: Colors.yellow),
              ),
              Text('menu1:Sale'),
              Divider(color: Colors.redAccent),
              Text('menu2:Stock'),
              Divider(color: Colors.blue),
              Text('menu3:Setting'),
              Divider(color: Colors.yellow),
            ],
          ),
        ),
      ),
    );
  }
}

/*
* ในตัวอย่าง จะใช้ ListView มาครอบ  DrawerHeader อีกที แลใช้ ListTile เป็น item
* https://flutter.dev/docs/cookbook/design/drawer
*
*
* */
