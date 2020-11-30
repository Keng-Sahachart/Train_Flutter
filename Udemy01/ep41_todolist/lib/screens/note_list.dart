import 'dart:async';
import 'package:flutter/material.dart';
import 'package:ep41_todolist/models/note.dart';
import 'package:ep41_todolist/utils/database_helper.dart';
import 'package:ep41_todolist/screens/note_detail.dart';
import 'package:sqflite/sqflite.dart';

class NoteList extends StatefulWidget{
  @override
  State<StatefulWidget> createState(){
    return NoteListState();
  }
}

class NoteListState extends State<NoteList> {

  DatabaseHelper databaseHelper = DatabaseHelper();
  List<Note> noteList;
  int count =0;

  @override
  Widget build(BuildContext context) {
    if(noteList == null){
      noteList = List<Note>();
     // updateListView();
    }

    return Scaffold(
      appBar: AppBar(
        title: Text('Notes')
      ),
      body:// getNoteListView()
      Scaffold(
        body: Center(
          child: Text('Test'),
        ),
      )
       ,
      floatingActionButton: FloatingActionButton(
        onPressed: (){},
        tooltip: 'Add Note',
        child: Icon(Icons.add),
      ),
    );
  }


}