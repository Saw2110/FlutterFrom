import 'dart:io';

import 'package:marketing/constant/database_constant.dart';
import 'package:marketing/model/dropdown_model.dart';
import 'package:marketing/service/databasehelper/database_helper.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class DropdownDBHelper {
  DropdownDBHelper._privateConstructor();

  static final DropdownDBHelper instance =
      DropdownDBHelper._privateConstructor();
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

  Future<int> insertData(DropDownDataModel data) async {
    Database? db = await instance.database;
    return await db!.insert(dropDownTable, data.toJson());
  }

  Future<int> deleteAllData() async {
    Database? db = await instance.database;
    return await db!.delete(dropDownTable);
  }

  Future<List<DropDownDataModel>> getDataList() async {
    Database? db = await instance.database;
    final List<Map<String, dynamic>> mapData = await db!.query(dropDownTable);
    return List.generate(mapData.length, (i) {
      return DropDownDataModel.fromJson(mapData[i]);
    });
  }

  Future<List<DropDownDataModel>> getFilterList(
      {required String filterFrom}) async {
    Database? db = await instance.database;
    final List<Map<String, dynamic>> mapData = await db!.rawQuery(
        '''Select * from $dropDownTable where $dropDownType = "$filterFrom" ''');
    return List.generate(mapData.length, (i) {
      return DropDownDataModel.fromJson(mapData[i]);
    });
  }

  getNameFromID({required String id, required String filterFrom}) async {
    String idValue = id;
    if (id == null) {
      idValue = "0";
    }
    Database? db = await instance.database;
    final List<Map<String, dynamic>> mapData = await db!.rawQuery(
        '''Select * from $dropDownTable where $dropDownType = "$filterFrom" and ID = "$idValue" ''');

    // CustomLog.errorLog(value: "\nValue => $mapData");

    if (mapData.isEmpty) {
      return "";
    } else {
      return mapData[0]["Name"].toString();
    }
  }
}
