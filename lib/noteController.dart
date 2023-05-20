import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class NoteController extends GetxController{
  final TextEditingController email = TextEditingController();
  final TextEditingController name = TextEditingController();
  final TextEditingController note = TextEditingController();
  // Insert Data

  void insertdata()async{
    var databasesPath = await getDatabasesPath();
    String path = join(databasesPath, 'demo.db');
    // open the database
    Database database = await openDatabase(path, version: 1,
        onCreate: (Database db, int version) async {
          // When creating the db, create the table
          await db.execute(
              'CREATE TABLE note '
                  '('
                  'id INTEGER PRIMARY KEY AUTOINCREMENT,'
                  ' email TEXT,'
                  ' name TEXT,'
                  ' note TEXT)'
          );
        });
    String emailValue = email.text;
    String nameValue = name.text;
    String noteValue = note.text;

    await database.transaction((txn) async {
      int id = await txn.rawInsert(
          'INSERT INTO note(email, name, note) VALUES(?, ?, ?)',
          [emailValue, nameValue, noteValue]);
      print('inserted row with id: $id');
    });

  }

  //Get Data

  Future<List<Map<String, dynamic>>> getdata() async {
    var databasesPath = await getDatabasesPath();
    String path = join(databasesPath, 'demo.db');
    // open the database
    Database database = await openDatabase(path, version: 1,
        onCreate: (Database db, int version) async {
          // When creating the db, create the table
          await db.execute(
              'CREATE TABLE note '
                  '('
                  'id INTEGER PRIMARY KEY AUTOINCREMENT,'
                  ' email TEXT,'
                  ' name TEXT,'
                  ' note TEXT)'
          );
        });
    List<Map<String, dynamic>> list = await database.rawQuery('SELECT * FROM note');
    return list;
  }

  //Delete Data

  deleterecord(int idx) async{
    var databasesPath = await getDatabasesPath();
    String path = join(databasesPath, 'demo.db');
    // open the database
    Database database = await openDatabase(path, version: 1,
        onCreate: (Database db, int version) async {
          // When creating the db, create the table
          await db.execute(
              'CREATE TABLE note '
                  '('
                  'id INTEGER PRIMARY KEY AUTOINCREMENT,'
                  ' email TEXT,'
                  ' name TEXT,'
                  ' note TEXT)'
          );
        });
    var count = Sqflite
        .firstIntValue(await database.rawQuery('SELECT COUNT(*) FROM note'));
    print(count);
    count = await database
        .rawDelete('DELETE FROM note WHERE id = ?', [idx]);


  }


  // UPdate Data


  updateNote({int? id,required String name,required String email,required String note})async{

    var databasesPath = await getDatabasesPath();
    String path = join(databasesPath, 'demo.db');
    // open the database
    Database database = await openDatabase(path, version: 1,
        onCreate: (Database db, int version) async {
          // When creating the db, create the table
          await db.execute(
              'CREATE TABLE note '
                  '('
                  'id INTEGER PRIMARY KEY AUTOINCREMENT,'
                  ' email TEXT,'
                  ' name TEXT,'
                  ' note TEXT)'
          );
        });
    int count = await database.rawUpdate(
        'UPDATE note SET email = ?, note = ?, name= ? WHERE id = ?',
        [email, note, name, id]);
  }

}
