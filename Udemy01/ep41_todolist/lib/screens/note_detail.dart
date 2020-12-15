import 'package:flutter/material.dart';
import 'package:ep41_todolist/models/note.dart';
import 'package:ep41_todolist/utils/database_helper.dart';
import 'package:intl/intl.dart';

class NoteDetail extends StatefulWidget {
  final String appBarTitle;
  final Note note;

  NoteDetail(this.note,this.appBarTitle);

  @override
  State<StatefulWidget> createState(){
    return NoteDetailState(this.note,this.appBarTitle);
  }
}

class NoteDetailState extends State<NoteDetail> {
  static var priorities = ['High','Low'];
  DatabaseHelper helper = DatabaseHelper();

  String appBarTitle;
  Note note;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    throw UnimplementedError();
  }
}