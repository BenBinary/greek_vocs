import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:greek_vocs/model/vocabulary.dart';

class DatabaseHelper {

  // Singleton Pattern
  // static Variable for the Database
  static final DatabaseHelper _databaseHelper = DatabaseHelper._();

  DatabaseHelper._();

  late Database database;

  factory DatabaseHelper() {
    return _databaseHelper;
  }

  setupDatabase() async {

    WidgetsFlutterBinding.ensureInitialized();
    // Open the database and store the reference.
    database = await openDatabase(
      // Set the path to the database. Note: Using the `join` function from the
      // `path` package is best practice to ensure the path is correctly
      // constructed for each platform.
      join(await getDatabasesPath(), 'greek_vocs.db'),

      onCreate: (db, version) async {
        // Run the CREATE TABLE statement on the database.
        return await db.execute(
          'CREATE TABLE vocabulary('
              'id INTEGER PRIMARY KEY, '
              'greek_voc TEXT, '
              'greek_voc_latin TEXT, '
              'english_voc TEXT);'
        );
      },
      // Set the version. This executes the onCreate function and provides a
      // path to perform database upgrades and downgrades.
      version: 1,
    );
  }

  Future<void> insertVocabulary(Vocabulary vocabulary) async {
    // Get a reference to the database.
    final db = await database;

    // Insert the Dog into the correct table. You might also specify the
    // `conflictAlgorithm` to use in case the same dog is inserted twice.
    //
    // In this case, replace any previous data.
    await db.insert(
      'vocabulary',
      vocabulary.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<List<Vocabulary>> getVocabulary() async {
    // Get a reference to the database.
    final db = await database;

    // Query the table for all The Dogs.
    final List<Map<String, dynamic>> maps = await db.query('vocabulary');

    // Convert the List<Map<String, dynamic> into a List<Dog>.
    return List.generate(maps.length, (i) {
      return Vocabulary(
          maps[i]['id'],
          maps[i]['greek_voc'],
          maps[i]['greek_voc_latin'],
          maps[i]['english_voc']);

    });
  }


}