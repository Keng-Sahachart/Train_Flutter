import 'package:flutter/material.dart';
void main(){
  runApp(MyApp());
}

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return MaterialApp(
      title:'RaiseButton App',
      home:Container(
        child: Center(
          child:Container(
            child: RaisedButton(
              color: Colors.yellowAccent,
              child: Text('button'),  //ถึงจะเป็น button ก็ต้องสร้าง text เอง
              onPressed: (){
                print('test press button at '+DateTime.now().toString());
              },
            ),
          )
        ),
      )

    );
  }
}