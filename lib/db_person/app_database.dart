import 'dart:async';
import 'package:floor/floor.dart';
import 'package:ki_flutter_2023/db_person/person.dart';
import 'package:ki_flutter_2023/db_person/person_dao.dart';
import 'package:sqflite/sqflite.dart' as sqflite;

part 'app_database.g.dart';

@Database(version: 2, entities: [Person])
abstract class AppDatabase extends FloorDatabase {
  PersonDao get personDao;
}

final migration1to2 = Migration(1, 2, (database) async {
  await database
      .execute('ALTER TABLE Person ADD COLUMN lastName TEXT DEFAULT \'\'');
});

final databaseLocal = $FloorAppDatabase
    .databaseBuilder('app_database.db')
    .addMigrations([migration1to2]).build();
