import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
            appBar: AppBar(
              title: Text('Adv Appbar'),
              // title อยู่ต่อจาก leading
              leading: IconButton(
                // leading อยู่ซ้ายสุดเสมอ ตาม document
                icon: Icon(Icons.menu),
                onPressed: () => {}, // ใส่ event ไว้เฉยๆ แล้ว จะเป็นสีขาว
              ),
              actions: <Widget>[
                IconButton(icon: Icon(Icons.search), onPressed: () => {}),
                // ตัวอย่าง ถ้าไม่ได้กำหนด method ไว้จะเป็นสีเทา
                IconButton(icon: Icon(Icons.more_vert), onPressed: null)
              ],
              // พื้นที่ ตรงกลาง
              flexibleSpace: SafeArea(
                // จำทำให้ icon ไม่ไป อยู่ในพื้นที่ notification
                child: Icon(
                  Icons.camera,
                  size: 50.0,
                  color: Colors.white70,
                ),
              ),
              bottom: PreferredSize(
                // บังคับต้องเป็น PreferredSize เท่านั้น
                child: Container(
                  height: null,
                  child: Text('this is bottom in app bar.'),
                ),
              ),
            ),
            bottomSheet: PreferredSize(
              // ไม่ใส่  PreferredSize ก็ได้
              child: Container(
                color: Colors.lightBlue,
                height: 50,
                alignment: Alignment.center,
                child: Text(
                  'this is bottomSheet',
                  style: TextStyle(
                      fontSize: 20,
                      color: Colors.white70,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
            body: Center(
              child: Text('Demo Advanced Appbar'),
            )));
  }
}
