import 'package:flutter/material.dart';
//import 'home_page.dart';

class LoginPage extends StatefulWidget {
  /* สัมพันธ์ กับ route*/
  static String tag = 'login-page';

  @override
  _LoginPageState createState() => new _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    final logo = Hero(
      tag: 'hero',
      child: CircleAvatar(
        backgroundColor: Colors.transparent,
        radius: 48.0,
        child: Image.asset('images/logoUser.png'),
      ),
    );

    final email = TextFormField(
      keyboardType: TextInputType.emailAddress,
      autofocus: false,
      initialValue: '',
      decoration: InputDecoration(
        hintText: 'Email',
        contentPadding: EdgeInsets.fromLTRB(20.0, 20.0, 20.0, 20.0),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(32.0)),
      ),
    );

    final password = TextFormField(
      autofocus: false,
      initialValue: '',
      obscureText: true,
      decoration: InputDecoration(
        hintText: 'Password',
        contentPadding: EdgeInsets.fromLTRB(20.0, 20.0, 20.0, 20.0),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(32.0)),
      ),
    );

    final loginButton = Padding(
      padding: EdgeInsets.symmetric(vertical: 16.0),
      child: RaisedButton(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
        onPressed: () {
          print('goto HomePage.tag');
          // Navigator.of(context).pushNamed(HomePage.tag);
        },
        padding: EdgeInsets.all(12),
        color: Colors.lightBlue,
        child: Text(
          'Login',
          style: TextStyle(color: Colors.white),
        ),
      ),
    );

    final forgotLabel = FlatButton(
      child: Text(
        'Forgot Password',
        style: TextStyle(color: Colors.black54),
      ),
      onPressed: () {
        print('I Forgot Password');
      },
    );

    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: ListView(
          padding: EdgeInsets.only(left: 24.0, right: 24.0),
          shrinkWrap: true,
          children: <Widget>[
            /* ไม่ต้องมี () */
            logo,
            SizedBox(height: 45),
            email,
            SizedBox(height: 20),
            password,
            SizedBox(height: 20),
            loginButton,
            forgotLabel
          ],
        ),
      ),
    );
  }
}
