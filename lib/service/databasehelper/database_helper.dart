import 'dart:io';

import 'package:marketing/constant/database_constant.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseHelper {
  DatabaseHelper._privateConstructor();

  static final DatabaseHelper instance = DatabaseHelper._privateConstructor();
  static Database? _database;

  Future<Database?> get database async {
    if (_database != null) return _database;
    _database = await _initiateDatabase();
    return _database;
  }

  _initiateDatabase() async {
    Directory directory = await getApplicationDocumentsDirectory();
    String path = join(directory.path, databaseName);
    return await openDatabase(path, version: dbVersion, onCreate: onCreate);
  }

  Future<void> onCreate(Database db, int version) async {
    /// Organization Detail
    await db.execute('''
      CREATE TABLE if not exists $orgDetailTable($columnPK INTEGER PRIMARY KEY,
                                                $flag TEXT ,
                                                $orgName TEXT ,
                                                $orgAddress TEXT,
                                                $orgType TEXT,
                                                $orgDistrict TEXT,
                                                $orgContactPerson TEXT,
                                                $orgLandlineNo TEXT,
                                                $mobileNo TEXT,
                                                $softwareType TEXT,
                                                $website TEXT,
                                                $software TEXT,
                                                $attendanceSystem TEXT,
                                                $smsService TEXT,
                                                $cloudBackUp TEXT,                                                
                                                $email TEXT,
                                                $orgPAN TEXT,
                                                $socialMedia TEXT,
                                                $latitude TEXT,
                                                $longitude TEXT,
                                                $leadSource TEXT,
                                                $leadProduct TEXT,
                                                $leadStatus TEXT,
                                                $leadStaff TEXT,
                                                $leadDate TEXT,
                                                $enquiryTime TEXT,
                                                $leadRemark TEXT,
                                                $quotePrice TEXT,
                                                $followFor TEXT,
                                                $followDate TEXT,
                                                $followTime TEXT,
                                                $followStaff TEXT,
                                                $followRemark TEXT)
      ''');

    /// DropDown Detail
    await db.execute('''
      CREATE TABLE if not exists $dropDownTable($dropDownId TEXT,
                                                $dropDownName TEXT,
                                                $dropDownType TEXT)
      ''');
  }
}
