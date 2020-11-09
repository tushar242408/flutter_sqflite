import 'dart:io';
import 'dart:ui';
import 'package:path/path.dart';

import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class dbhelper{
  static final databasename="my.db";
  static final databaseversion=1;
  static final table="mytable";
  static final columnId="Id";
  static final  columnname="name";
  static final columnage="age";
  static Database database;
   dbhelper.privateconstructor();
   static final dbhelper instance=dbhelper.privateconstructor();

  Future<Database> get db async{
    if(database!=null){
      return database;
    }
    database= await makedatabase();
    return database;

  }
  makedatabase() async{
    Directory directory= await getApplicationDocumentsDirectory();
    String path;
    path=join(directory.path,databasename);
    return openDatabase(path, version: databaseversion,onCreate: _oncreate);
  }
  Future _oncreate(Database db, int version) async{
    String sql="create table $table ($columnId INTEGER PRYMARY KEY,$columnname Text,$columnage INTEGER)";
    await db.execute(sql);

  }
  Future<int> insert(Map<String,dynamic> row) async{
    Database datab=await instance.db;
    return datab.insert(table, row);

  }
  Future<int> delete(int id) async{
    Database datab=await instance.db;
    String sql="delete from $table where ID=$id";
    datab.rawQuery(sql);
    return 1;
  }
     alldata() async{
    Database datab=await instance.db;
    String sql="select * from $table";
    List<Map<String,dynamic>> r= await datab.rawQuery(sql);
    return r;
  }




}