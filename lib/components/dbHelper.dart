import 'dart:async';
import 'dart:core';

import 'package:appcent_news_app/models/news/news_data_model.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DataBaseHelper {
  static Database? _db;

  Future<Database> get database async {
    _db ??= await initializeDb();
    return _db!;
  }

  Future<Database> initializeDb() async {
    String dbpath = join(await getDatabasesPath(), 'etrade.db');

    var eTradeDb = openDatabase(dbpath, version: 1, onCreate: crateDb);
    print("databease oluşturdu");
    return eTradeDb;
  }

  void crateDb(Database db, int version) async {
    await db.execute(
        "CREATE TABLE news (no INTEGER PRIMARY KEY,id TEXT,name TEXT ,author TEXT,title TEXT, description TEXT,url TEXT,urlToImage TEXT ,publishedAt TEXT, content TEXT)");
  }

////
  ///come News
  ///
  Future<List<NewsDataModel>> comeNews() async {
    Database db = await database;
    print("database adresi gelidi");
    List<Map<String, dynamic>> maps = await db.query('news');

    print('${maps}qq');
  
    return List.generate(maps.length, (i) {
      return NewsDataModel.fromJson(maps[i]);
    });
  }

/////insert
  ///read-only
  ///

  Future<void> insert(NewsDataModel data) async {
    print("ilk");
    final Database datab = await database;
    print("ikinci${data.toJson()}");
    var jsonData = data.toJson();
    final id = <String, dynamic>{
      'id': jsonData['source']['id'],
      'name': jsonData['source']['name']
    };
    jsonData.addEntries(id.entries);
    jsonData.remove('source');
    await datab.insert('news', jsonData,
        conflictAlgorithm: ConflictAlgorithm.replace);
  }

  Future<int> delete(int id) async {
    Database db = await database;
    var result = await db.rawDelete("delete from news where id=$id");
    print(id);
    return result;
  }
}
