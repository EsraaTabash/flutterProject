
import 'dart:developer';

import 'package:sqflite/sqflite.dart';
import 'Section.dart';

class DbHelper {

 static late Database database;

 DbHelper._();

 static initDb()async{
   String path = await getDatabasesPath();
   String databasePath = path+"/sections.db";
   database = await openDatabase(
       databasePath,
       version: 1,
       onCreate: (db,v){
          db.execute('''
  CREATE TABLE sections(
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    name TEXT,
    content TEXT,
    count INTEGER,
    ref TEXT
  )
''');

       }
   );
}
static insertNewSection(Section section)async{
   int rowNumber = await database.insert("sections", section.toMap());
   log(rowNumber.toString());

}

 static Future<List<Map<String, dynamic>>> getAllSections() async {
   List<Map<String, dynamic>> results = await database.query('sections');
   return results;
 }

 static deleteSection(int id) async {
   await database.delete('sections', where: "id=$id");
 }

 static updateSection() async {

 }
}
