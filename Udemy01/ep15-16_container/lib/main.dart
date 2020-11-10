import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Example of container",
      home: Center(
        child: Container(
          // height: 200.0,   //ระบุเป็น center แล้ว ไม่ใช้ก็ได้
          // width: 200.0,
          child: Text('Text'),
        ),
      ),
    );
  }
}
