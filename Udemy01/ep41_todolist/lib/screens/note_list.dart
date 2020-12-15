import 'dart:async';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:ep41_todolist/models/note.dart';
import 'package:ep41_todolist/utils/database_helper.dart';
import 'package:ep41_todolist/screens/note_detail.dart';
import 'package:sqflite/sqflite.dart';

class NoteList extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return NoteListState();
  }
}

class NoteListState extends State<NoteList> {
  DatabaseHelper databaseHelper = DatabaseHelper();
  List<Note> noteList;
  int count = 0;

  @override
  Widget build(BuildContext context) {
    if (noteList == null) {
      noteList = List<Note>();
      // updateListView();
    }

    return Scaffold(
      appBar: AppBar(title: Text('Notes')),
      body: // getNoteListView()
          Scaffold(
        body: Center(
          child: Text('Test'),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          debugPrint('FAB clicked');
          // navigateToDetail(Note('','',2),'Add Note');
        },
        tooltip: 'Add Note',
        child: Icon(Icons.add),
      ),
    );
  }

/* ep 49 */

  ListView getNoteListView() {
    TextStyle titleStyle = Theme.of(context).textTheme.subhead;

    return ListView.builder(
        itemCount: count,
        itemBuilder: (BuildContext context, int position) {
          // กำหนดค่า card แต่ละ loop ให้แต่ ละ note
          return Card(
            color: Colors.white,
            elevation: 2.0, // ระยะ
            child: ListTile(
              leading: CircleAvatar(
                backgroundColor:
                    getpriorityColor(this.noteList[position].priority),
                child: getPriorityIcon(this.noteList[position].priority),
              ),
              title: Text(this.noteList[position].date),
              trailing: GestureDetector(
                child: Icon(Icons.delete, color: Colors.grey),
                onTap: () {
                  _delete(context, noteList[position]);
                },
              ),
              onTap: () {
                debugPrint('ListTile Tapped');
                navigateToDetail(this.noteList[position], 'Edie Note');
              },
            ),
          );
        });
  }

  Icon getPriorityIcon(int priority) {
    switch (priority) {
      case 1:
        return Icon(Icons.play_arrow);
        break;
      case 2:
        return Icon(Icons.keyboard_arrow_right);
        break;
      default:
        return Icon(Icons.keyboard_arrow_right);
    }
  }

  Color getPriorityColor(int priority) {
    switch (priority) {
      case 1:
        return Colors.red;
        break;
      case 2:
        return Colors.yellow;
        break;
      default:
        return Colors.yellowAccent;
    }
  }

  void _delete(BuildContext context, Note note) async {
    int result = await databaseHelper.deleteNote(note.id);

    if (result != 0) {
      _showSnackBar(context,'Note Deleted Succesfully');
      updateListView();
    }
  }

  void _showSnackBar(BuildContext context ,String message){
    final snackBar = SnackBar(content: Text(message),);
    Scaffold.of(context).showSnackBar(snackBar);
  }

  void navigateToDetail(Note note,String title) async{
    bool result = await Navigate.push(context,MaterialPageRoute(builder: (context){
      return NoteDetail(Note,title);
    }));

    if(result == true){
      updateListView();
    }
  }

  void updateListView(){
    final Future<Database> dbFuture = databaseHelper.initializeDatabase();
    dbFuture.then((database){
      Future<List<Note>> noteListFuture = databaseHelper.getNoteList();
      noteListFuture.then((noteList){
        setState(() {
          this.noteList = noteList;
          this.count = noteList.length;
        });
      });
    });
  }

}
