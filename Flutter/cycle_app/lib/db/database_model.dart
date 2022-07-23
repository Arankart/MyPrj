import 'dart:html';
import 'dart:io';

import 'package:cycle_app/model/training_data_model.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

import 'package:sqflite/sqlite_api.dart';

class DBProvider {
  DBProvider._();
  static final DBProvider db = DBProvider._();

  static Database? _database;

  late String db_name = "Trainings.db";
  late String table_name = "Trainings";
  late String column_id = "id";
  late String column_title = "title";
  late String column_description = "description";
  late String column_preparation = "preparation";
  late String column_work = "work";
  late String column_relax = "relax";
  late String column_cycle = "cycle";

  Future<Database> get database async {
    if (_database != null) return _database!;

    _database = await _initDB();
    return _database!;
  }

  Future<Database> _initDB() async {
    Directory dir = await getApplicationDocumentsDirectory();
    String path = join(dir.path, db_name);
    return await openDatabase(path, version: 1, onCreate: _createDB);
  }

  void _createDB(Database db, int vertion) async {
    await db.execute(
        "CREATE TABLE $table_name ($column_id INTEGER PRIMARY KEY AUTOINCREMENT, $column_title TEXT," +
            " $column_description TEXT, $column_preparation INTEGER, $column_work INTEGER" +
            " $column_relax INTEGER, $column_cycle INTEGER)");
  }

  // Read
  Future<List<Training>> getTrainings() async {
    Database db = await this.database;
    final List<Map<String, dynamic>> trainingMapList =
        await db.query(table_name);
    final List<Training> trainingList = [];
    trainingMapList.forEach((element) {
      trainingList.add(Training.fromMap(element));
    });

    return trainingList;
  }

  // Add
  Future<Training> addTraining(Training training) async {
    Database db = await this.database;
    training.id = await db.insert(table_name, training.toMap());
    return training;
  }

  // Update
  Future<int> updateTraining(Training training) async {
    Database db = await this.database;
    return await db.update(table_name, training.toMap(),
        where: "$column_id = ?", whereArgs: [training.id]);
  }

  // Delete
  Future<int> deleteTraining(int id) async {
    Database db = await this.database;
    return await db
        .delete(table_name, where: "$column_id = ?", whereArgs: [id]);
  }
}
