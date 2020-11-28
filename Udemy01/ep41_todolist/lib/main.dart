import 'package:flutter/material.dart';
import 'package:ep41_todolist/screens/note_list.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(primarySwatch: Colors.lightBlue),
        title: 'TodoListApp',
        home: Text('NodeList()'));
  }


}
