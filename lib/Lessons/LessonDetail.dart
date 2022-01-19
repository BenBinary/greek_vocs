import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:greek_vocs/model/vocabulary.dart';
import '../ScreenArguments.dart';
import '../model/vocModel.dart';
import '../res/vocData.dart';
import '../model/jsonStorage.dart';
import 'package:flutter/services.dart' show rootBundle;

import 'dart:async';

import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class LessonDetail extends StatefulWidget {

  final ScreenArguments screenargument;

  const LessonDetail({Key? key,  required this.screenargument}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _LessonDetailState(screenargument);

}

class _LessonDetailState extends State<LessonDetail> {

  var database;

  setupDatabase() async {

    WidgetsFlutterBinding.ensureInitialized();
    // Open the database and store the reference.
    database = openDatabase(
      // Set the path to the database. Note: Using the `join` function from the
      // `path` package is best practice to ensure the path is correctly
      // constructed for each platform.
      join(await getDatabasesPath(), 'greek_vocs.db'),

      onCreate: (db, version) {
        // Run the CREATE TABLE statement on the database.
        return db.execute(
          'CREATE TABLE vocabulary('
              'id INTEGER PRIMARY KEY, '
              'greek_voc TEXT, '
              'greek_voc_latin TEXT, '
              'english_voc TEXT,)',
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

  late ScreenArguments screenargument;
  var index = 0;

  // Constructor
  _LessonDetailState(ScreenArguments sa) {

    this.screenargument = sa;

  }

  Future<String> getJson() async {

    return await rootBundle.loadString('../res/foodData.json');
  }





  @override
  Widget build(BuildContext context) {

    Iterable parsedJson = json.decode(vocData.listOfAllVocs);

    List<vocModel> vocList = List<vocModel>.from(parsedJson.map((e) => vocModel.fromJson(e)));

    var v = vocList.elementAt(index);

    var currentGreekVocLatin = v.greekVocLatin;
    var currentEnglishVoc = v.englishVoc;
    var currentGreekVoc = v.greekVoc;

    // Serialize the json string
    //Map<String, dynamic> changedJsonFile = vocList.elementAt(0).toJson();
    String s = jsonEncode(vocList);
    vocData.listOfAllVocs = s;


    return Scaffold(
      appBar: AppBar(
        title: Text('Lesson for ${screenargument.title}'),
      ),
      body: Center(
          widthFactor: 200,
          heightFactor: 200,
          child: Column(
            verticalDirection: VerticalDirection.down,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,


            children: [
              Text('English Word:  ${
                  FutureBuilder<dynamic?>(future: setupDatabase();, builder: (context, snapshot) {

                   // setupDatabase();
                   // insertVocabulary(new Vocabulary(1, "", "", "english_voc"));

                if(snapshot.connectionState == ConnectionState.done) {

                  return snapshot.data;

                } else {
                  return snapshot.data;
                }
              },)}!'),
              Text('Greek Word in Latin: ${vocList.elementAt(index).greekVocLatin}!'),
              Text('Greek Word: ${vocList.elementAt(index).greekVoc}!'),
              Text('Hard Word: ${vocList.elementAt(index).hardWord}!'),
              ElevatedButton(onPressed: () {

                setState(() {

                  if (index > 0) {

                    index = index - 1;
                    currentEnglishVoc = vocList.elementAt(index).englishVoc;
                    currentGreekVocLatin = vocList.elementAt(index).greekVoc;

                  }

                });


              }, child: const Text('Previos Word')),
              ElevatedButton(onPressed: () {

                print("Length: ${vocList.length}");

                print("Index: ${index}");

                setState(() {

                  if (index < (vocList.length-1)) {

                    index = index + 1;
                    currentEnglishVoc = vocList.elementAt(index).englishVoc;
                    currentGreekVocLatin = vocList.elementAt(index).greekVoc;
                  }


                });

              }, child: const Text('Next Word')),
              ElevatedButton(onPressed: () {

                setState(() {
                  // Change the value of hardWord
                  vocList.elementAt(index).hardWord = true;

                  // Save JSON file
                  String s = jsonEncode(vocList);
                  vocData.listOfAllVocs = s;
                  parsedJson = json.decode(vocData.listOfAllVocs);
                  vocList = List<vocModel>.from(parsedJson.map((e) => vocModel.fromJson(e)));

                  print(vocData.listOfAllVocs);


                });





              }, child: const Text('I got this word')),
              ElevatedButton(
                  onPressed: ()
                  {
                    Navigator.pop(context);
                  },
                  child: const Text('Go Back to Menu')),
            ],
          )

      ),
    );
  }

}



