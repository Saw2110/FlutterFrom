import 'dart:io';

import 'package:marketing/constant/database_constant.dart';
import 'package:marketing/model/entry_detail_model.dart';
import 'package:marketing/service/databasehelper/database_helper.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class OrgDataDBHelper {
  OrgDataDBHelper._privateConstructor();

  static final OrgDataDBHelper instance = OrgDataDBHelper._privateConstructor();
  static Database? _database;

  Future<Database?> get database async {
    if (_database != null) return _database;
    _database = await _initiateDatabase();
    return _database;
  }

  _initiateDatabase() async {
    Directory directory = await getApplicationDocumentsDirectory();
    String path = join(directory.path, databaseName);
    return await openDatabase(path,
        version: dbVersion, onCreate: DatabaseHelper.instance.onCreate);
  }

  Future<int> insertData(EntryDetailModel data) async {
    Database? db = await instance.database;
    return await db!.insert(orgDetailTable, data.toJson());
  }

  Future deleteData({required String idValue}) async {
    Database? db = await instance.database;
    return await db!.rawQuery(
        '''Delete from  $orgDetailTable where PrimaryID = "$idValue" ''');
  }

  Future<int> deleteAllData() async {
    Database? db = await instance.database;
    return await db!.delete(orgDetailTable);
  }

  Future<List<EntryDetailModel>> getDataList() async {
    Database? db = await instance.database;
    final List<Map<String, dynamic>> mapData = await db!.query(orgDetailTable);
    return List.generate(mapData.length, (i) {
      return EntryDetailModel.fromJson(mapData[i]);
    });
  }
}
