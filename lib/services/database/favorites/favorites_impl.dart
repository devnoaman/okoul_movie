import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

import 'package:okoul/services/database/favorites/favorites_database.dart';
import 'package:okoul/services/database/favorites/models/favorite_model.dart';

class FavoritesImpl extends ChangeNotifier
    implements FavoritesDatabase<FavoriteModel, int> {
  static Database? _database;
  FavoritesImpl() {
    print('intit db');
    _initDatabase();
  }
  static const String _tableName = 'Favorites';

  static const _databaseName = 'favorites_database.db';

  Future<Database> get database async {
    _database ??= await _initDatabase();
    return _database!;
  }

  Future<Database> _initDatabase() async {
    return openDatabase(
      join(await getDatabasesPath(), _databaseName),
      onCreate: (db, _) async {
        await db.execute('''
          CREATE TABLE $_tableName(
            id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
            name TEXT NOT NULL,
            description TEXT,
            rate Double NOT NULL,
            release TEXT NOT NULL,
            img TEXT NOT NULL
          )
        ''').then((value) => print('$_tableName created'));
      },
      onOpen: (db) => print(db),
      version: 1,
    );
  }

  @override
  Future<List<FavoriteModel>> allFav() async {
    final db = await database;
    var res = await db.query(_tableName);
    return res
        .map(
          (e) => FavoriteModel.fromJson(e),
        )
        .toList();
  }

  @override
  Future<void> deleteFav(int id) async {
    final db = await database;
    await db.delete(
      _tableName,
      where: 'id = ?',
      whereArgs: [id],
    );
    notifyListeners();
  }

  @override
  Future<FavoriteModel> insertFav(FavoriteModel item) async {
    final db = await database;
    var v = item.toJson();
    print(v);
    late final FavoriteModel todoEntity;
    await db.transaction((txn) async {
      final id = await txn.insert(
        _tableName,
        item.toJson(),
        conflictAlgorithm: ConflictAlgorithm.replace,
      );
      final results =
          await txn.query(_tableName, where: 'id = ?', whereArgs: [id]);
      todoEntity = FavoriteModel.fromJson(results.first);
    });
    notifyListeners();
    return todoEntity;
  }

  @override
  Future<void> updateFav(FavoriteModel item) async {
    final db = await database;
    final int id = item.id!;
    await db.update(
      _tableName,
      item.toJson(),
      where: 'id = ?',
      whereArgs: [id],
    );
  }

  @override
  Future<FavoriteModel?> find(int id) async {
    final db = await database;
    var res = await db.query(_tableName, where: 'id = ?', whereArgs: [id]);
    return res.isEmpty ? null : FavoriteModel.fromJson(res[0]);
  }
}
