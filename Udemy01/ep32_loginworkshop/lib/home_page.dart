import 'package:ep32_loginworkshop/login_page.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  static String tag = 'home-page';

  @override
  Widget build(BuildContext context) {
    final logo = Hero(
      tag: 'hero',
      child: Padding(
        padding: EdgeInsets.all(16),
        child: CircleAvatar(
          backgroundColor: Colors.transparent,
          radius: 68.0,
          child: Image.asset('images/logoUser.png'),
        ),
      ),
    );

    final welcome = Padding(
      padding: EdgeInsets.all(8.0),
      child: Text(
        'Welcome to my Flutter app.',
        style: TextStyle(color: Colors.white, fontSize: 20.0),
      ),
    );

    final lorem = Padding(
      padding: EdgeInsets.all(8.0),
      child: Text(
        "    Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.",
        style: TextStyle(
          fontSize: 16.0,
          color: Colors.white,
        ),
        textAlign: TextAlign.justify, // ทำให้ font กระจาย
      ),
    );

    final btnBackToLogin = FlatButton(
        onPressed: () {
          print('before goto Login page.');
          Navigator.of(context).pushNamed(LoginPage.tag);
          print('after goto Login page.');
        },
        child: Text(
          'Back to Login Page.',
          style: TextStyle(color: Colors.white70),
        ));

    return Scaffold(
      body: Container(
        /*ต้องใช้ Container เพราะต้องใช้ width*/
        width: MediaQuery.of(context).size.width,
        padding: EdgeInsets.all(28),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            /*  // ใช้ยังไงว่ะ
           tileMode: TileMode.mirror,
            begin: AlignmentGeometry.lerp(
                Alignment.bottomLeft, Alignment.bottomRight, 10.0),*/
            colors: [
              Colors.blue,
              Colors.lightBlueAccent,
            ],
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            logo,
            welcome,
            lorem,
            Align(
              alignment: Alignment.bottomRight,
              child: btnBackToLogin,
            )
          ],
        ),
      ),
    );
  }
}
