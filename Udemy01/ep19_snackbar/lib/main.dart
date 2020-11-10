import 'package:flutter/material.dart';

void main() {
  runApp(SnackBarDemo());
}

class SnackBarDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'SnackBar Demo',
        home: Scaffold(
          appBar: AppBar(
            title: Text("ScackBar Demo Test"),
          ),
          body: SnackBarPage(), /* ไปเรียก class มาแสดง*/
        ));
  }
}

class SnackBarPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      /* ไม่ได้เรียก MaterialApp */

      child: RaisedButton(
        onPressed: () {
          /*ตัวแปร SnackBar พร้อมระบุ คำสั่ง label action*/
          final snackBar = SnackBar(
              content: Text('This is SnackBar'),
              action: SnackBarAction( // ต้องประกาศ เป็น class Action ภายใน ตัว  SnackBar ด้วย
                label: 'Undo',
                onPressed: () {  // statement
                  print('---->   printed from SnackBar   <----');
                },
              ));

          /*หลังจาก ประกาศ SnackBar แล้ว มันยังทำงานเองไม่ได้ ต้องสั่งให้ show ด้วย ผ่าน context*/
          Scaffold.of(context).showSnackBar(snackBar);
        },
        child: Text("Button"),
        color: Colors.yellowAccent,
      ),
    );
  }
}
