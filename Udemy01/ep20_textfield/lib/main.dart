import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
            appBar: AppBar(
              title: Text("Text Field Demo"),
            ),
            body: Center(
                child: TextField(
              obscureText: true, //password mode text tobe show star ****
              decoration: InputDecoration(
                  labelText: "Enter Your Name ดูสิ.",
                  icon: Icon(Icons.lock) // รูป
                  ),
            ))));
  }
}
