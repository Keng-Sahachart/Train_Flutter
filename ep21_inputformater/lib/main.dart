import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

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
            obscureText: false, //password mode text tobe show star ****
            decoration: InputDecoration(
                labelText: "Enter Your Text for testing Input Formatter",
                icon: Icon(Icons.lock) // รูป
            ),
            /********************************/
            // this is input formatter
            keyboardType:TextInputType.emailAddress,  // number,phone,emailAddress
            inputFormatters: [
              // ignore: deprecated_member_use
              // BlacklistingTextInputFormatter(RegExp('[0-9]')), // จะกด ไม่ได้
              // ignore: deprecated_member_use
              WhitelistingTextInputFormatter(RegExp('[0-9]')), // จะกด เพียงอย่างเดียว
              LengthLimitingTextInputFormatter(10)   // ถ้าเกินจะไม่ยอมให้พิมพ์
            ],
          ),
        ),
      ),
    );
  }
}
