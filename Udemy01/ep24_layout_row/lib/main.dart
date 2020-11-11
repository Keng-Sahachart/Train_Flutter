import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "row Demo",
      home: Scaffold(
          appBar: AppBar(
            title: Text('row Demo'),
          ),
          body: Center(
            child: Row(
              children: <Widget>[
                SizedBox(
                  // ใส่ sizebox เพื่อให้ Text มีพื้นที่รอบๆอีกที
                  width: 150,
                  child: Text('Cell01'),
                ),
                SizedBox(
                  width: 150,
                  child: Text('Cell02'),
                ),
                Text('Cell03'),
              ],
            ),
          )),
    );
  }
}
