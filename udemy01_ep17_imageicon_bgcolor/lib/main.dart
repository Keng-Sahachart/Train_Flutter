import 'dart:ui';

import 'package:flutter/material.dart';

void main(){
  runApp(MyApp());
}

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Container(
        child:
        Image.asset('images/pikachu.png'),  // แสดงไฟล์ จาก asset ภายใน app

        // Image.network('http://www.pngmart.com/files/2/Pikachu-PNG-Photos.png'),   // รูปภาพจาก web

        //Icon(Icons.flag),   // ใช้ icon แสดง

        height: 10,  //*** กว้าง สูง ไม่มีผลเลย
        width: 10,

        color: Colors.white,
      )
    );
  }
}