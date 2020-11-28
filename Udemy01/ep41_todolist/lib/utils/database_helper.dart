import 'dart:core';

import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';
import 'dart:async';
import 'dart:io';
import 'package:path_provider/path_provider.dart';

import 'package:ep41_todolist/models/note.dart';

class DatabaseHelper {
  static DatabaseHelper _databaseHelper;
  static Database _database;

  String noteTable = 'note_table';
  String colId = 'id';
  String colTitle = 'title';
  String colDescription = 'description';
  String colPriority = 'priority';
  String colDate = 'date';

  DatabaseHelper._createInstance();

  factory DatabaseHelper() {
    /* ป้องกัน error ถ้าไม่มีให้สร้าง*/
    if (_databaseHelper == null) {
      _databaseHelper = DatabaseHelper._createInstance();
    }
    return _databaseHelper;
  }

  Future<Database> get database async {
    if (_database == null) {
      _database = await initializeDatabase();
    }

    return _database;
  }

  Future<Database> initializeDatabase() async {
    Directory directory = await getApplicationDocumentsDirectory();
    String path = directory.path + 'notes.db';

    var notesDatabase =
        await openDatabase(path, version: 1, onCreate: _createDb);

    return notesDatabase;
  }

  void _createDb(Database db, int newVersion) async {
    await db.execute('CREATE TABLE $noteTable('
        '$colId INTEGER PRIMARY KEY AUTOINCREMENT,'
        '$colTitle TEXT,'
        '$colDescription TEXT,'
        '$colPriority INTEGER,'
        '$colDate TEXT'
        ')');
  }

  /*  * ep 46  * */
  Future<List<Map<String, dynamic>>> getNoteMapList() async {
    Database db = await this.database;
    return await db.query(noteTable, orderBy: '$colPriority ASC');
  }
}
