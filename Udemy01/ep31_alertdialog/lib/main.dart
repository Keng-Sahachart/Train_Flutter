import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Dialog',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Dialog'),
        ),
        body: DialogHome(),
      ),
    );
  }
}

class DialogHome extends StatelessWidget {
  /*
  * ในคลิป
  * */
  Future _showAlertDialog(inContext) async {
    await showDialog(
      context: inContext,
      builder: (BuildContext inContext) {
        return AlertDialog(
          title: Text('Welcome My App.'),
          content: Center(
            child: Text('This is My GitHub.'),
          ),
          actions: <Widget>[
            FlatButton(
                // ปุ่ม ที่ไม่มีขอบ เป็นเหมือน link
                onPressed: () {
                  print('you press ok');
                  Navigator.of(inContext).pop();
                  /* จำเป็นต้องมี .pop() เพราะเป็นคำสั่งที่เอา dialog ออก ถ้าไม่มี กด ok แล้วจะไม่ปิด dialog แต่สามาระ คลิกปิดที่ นอก dialog ได้
                  * */
                },
                child: Text('OK'))
          ],
        );
      },
    );
  }



  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          // วางหลอกๆ ให้ ปุ่ม อยู่ตรงกลาง
          height: 50,
        ),
        RaisedButton(
          child: Text('Show Dialog'),
          onPressed: () {
            _showAlertDialog(
                context); // ประกาศฟังชั่นใน build เลยไม่ต้องใส่ parameter
          },
        )
      ],
    );
  }
}
