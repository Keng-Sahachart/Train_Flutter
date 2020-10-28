import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(new MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My App StatelessWidget...', // Display when floating app
      home: Scaffold(
        appBar: AppBar(
          // display in title app
          title: Text('My App StatelessWidget (Scaffold)'),
        ),
        body: Center(
          /*   จะอยู่ตรงกลาง   และมี child อันเดียว
          // กล่องตกแต่ง เหมือน contain
            child: DecoratedBox(
                decoration: BoxDecoration(color: Colors.lightBlue),
                child: Padding(
                    ////padding ถือเป็น เหมือน contain
                    padding: EdgeInsets.all(8.0),
                child: Text('Hello DecoratedBox')),
      ),
          */
          /* ถ้าต้องการ child หลายๆตัว วางซ้อนกัน*/
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center, // กลาง ระหว่าง บน-ล่าง
            /*children คือ ต้องการ widget หลายตัว*/
            children: <Widget>[
              DecoratedBox(
                decoration: BoxDecoration(color: Colors.redAccent),
                child: Padding(
                  padding: EdgeInsets.all(10),
                  child: Text('TextBox 1'),
                ),
              ),
              DecoratedBox(
                decoration: BoxDecoration(color: Colors.greenAccent),
                child: Padding(
                  padding: EdgeInsets.all(20),
                  child: Text('TextBox 2'),
                ),
              ),
              DecoratedBox(
                decoration: BoxDecoration(color: Colors.yellowAccent),
                child: Padding(
                  padding: EdgeInsets.all(30),
                  child: Text('TextBox 3'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
