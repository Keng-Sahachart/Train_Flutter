import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "card and Divider Demo",
      home: Scaffold(
        appBar: AppBar(
          title: Text('card and divider'),
        ),
        body: Card(
          // ทำให้อยู่ กลางจอ ในแนวตั้ง
          child: Center(
            child: Column(
              // min ทำให้ column พอดีกับ content ไม่ยาว ลงไป ถึงล่างจอ
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Text('Text1'),
                Divider(), //เส้นขั้นแบ่ง
                Text('Text2'),
                Divider(),
                Text('Text3'),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
