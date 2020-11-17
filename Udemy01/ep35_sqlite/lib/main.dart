import 'package:flutter/material.dart';

import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

/* async เพราะ จะให้มัน run ต่อเนื่อง */
void main() async {
  /* ep 36 */
  final database = openDatabase(
      join(await getDatabasesPath(), 'flutter_database.db'),
      version: 1, onCreate: (db, version) {
    print('connect success');
    return db.execute(
        'create table dogs(id Integer primary key,name text,age integer)');
  });

  /* ep 37 insert */
  Future<void> insertDog(Dog dog) async {
    // await รอให้ database connected แล้ว
    final Database db = await database;
    await db.insert('dogs', dog.toMap(),
        conflictAlgorithm: ConflictAlgorithm.replace);
    /*optional ต้องกำหนด ใส่ชื่อ parameter ด้วย -> conflictAlgorithm: */
  }

  /* ep 38 select */
  Future<List<Dog>> dogs() async {
    final Database db = await database;

    /* ได้ ออกมา เป็น key และ value */
    final List<Map<String, dynamic>> maps = await db.query('dogs');

    /* วนลูป return ออกมา เป็น dog ในลักษณะ Array List */
    return List.generate(maps.length, (index) {
      return Dog(
          id: maps[index]['id'],
          name: maps[index]['name'],
          age: maps[index]['age']);
    });
  }

  /* ep 39 update */
  Future<void> updateDog(Dog dog) async {
    final db = await database;
    await db.update(
      'dogs',
      dog.toMap(),
      where: "id = ?",
      /* ต้องเป็น double quote เสมอ / ? คือ จะถูกแทนที่ด้วย whereArgs */
      whereArgs: [dog.id],
    );
    /*ถ ้ามีหลายตัวก็ใส่ where:  "id = ? and name = ?"
      where: "id = ?",
      whereArgs: [dog.id,dog.name],
      * */
  }

  /* ep40 delete and example used command */
  Future<void> deleteDog(int id) async {
    /*delete ใช้ id อย่างเดียว ก็พอ*/
    final db = await database;
    await db.delete('dogs', where: "id = ?", whereArgs: [id]);
  }

  /* Example to used command */
  var kowit = Dog(id: 0, name: 'kowit', age: 35);

  /* when insert to database */
  await insertDog(kowit);
  print(await dogs());  // ดูค่าใหม่ ของ database

  /* when edit */
  kowit = Dog(id: kowit.id, name: kowit.name, age: kowit.age + 7);

/* when update */
  await updateDog(kowit);
  print(await dogs());

  /* when delete */
  await deleteDog(kowit.id);
  print(await dogs());
}

/* ep 37 insert*/
class Dog {
  /* Structure Define */
  final int id;
  final String name;
  final int age;

  /* constructure */
  Dog({this.id, this.name, this.age});

  /* จับตัวแปร ให้ สัมพันธุ์กัน กับโครงสร้าง table /dynamic คือ อะไรก็ได้ /???*/
  Map<String, dynamic> toMap() {
    return {'id': id, 'name': name, 'age': age};
  }

  /* ??? */
  @override
  String toString() {
    return 'Dog{id: $id, name: $name, age: $age}';
  }
}
