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
  Future _showPopup(inContext) async {
    switch (await showDialog(
        context: inContext,
        builder: (BuildContext inContext) {
          return SimpleDialog(
            title: Text('are you sure?'),
            children: <Widget>[
              SimpleDialogOption(
                child: Text('Yes'),
                onPressed: () {
                  print('you press yes.');
                  Navigator.pop(inContext,
                      'Yes'); // ต้องใช้ Navigator ในการ ส่งค่าออก เพื่อทำ case
                },
              ),
              SimpleDialogOption(
                child: Text('No'),
                onPressed: () {
                  print('You press No:');
                  Navigator.pop(inContext, 'No');
                },
              )
            ],
          );
        })) {
      case 'Yes':
        print('case => Yes.');
        break;
      case 'No':
        print('case => No');
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    Future _showPopupInternal() async {
      switch (await showDialog(
          context: context,
          builder: (BuildContext inContext) {
            return SimpleDialog(
              title: Text('(internal Build) are you sure?'),
              children: <Widget>[
                SimpleDialogOption(
                  child: Text('Yes'),
                  onPressed: () {
                    print('(internal Build) you press yes.');
                    Navigator.pop(inContext,
                        'Yes'); // ต้องใช้ Navigator ในการ ส่งค่าออก เพื่อทำ case
                  },
                ),
                SimpleDialogOption(
                  child: Text('No'),
                  onPressed: () {
                    print('(internal Build) You press No:');
                    Navigator.pop(inContext, 'No');
                  },
                )
              ],
            );
          })) {
        case 'Yes':
          print('(internal Build) case => Yes.');
          break;
        case 'No':
          print('(internal Build) case => No');
          break;
      }
    }

    return Column(
      children: <Widget>[
        Container(
          // วางหลอกๆ ให้ ปุ่ม อยู่ตรงกลาง
          height: 50,
        ),
        RaisedButton(
          child: Text('Show Dialog'),
          onPressed: () {
            // _showPopup(context);
            _showPopupInternal(); // ประกาศฟังชั่นใน build เลยไม่ต้องใส่ parameter
          },
        )
      ],
    );
  }
}
