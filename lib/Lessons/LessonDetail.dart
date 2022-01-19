import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:greek_vocs/DatabaseHelper.dart';
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

  late DatabaseHelper databaseHelper;
  late ScreenArguments screenargument;
  var index = 0;

  // Constructor
  _LessonDetailState(ScreenArguments sa) {

    this.screenargument = sa;

  }

  @override
  void initState() {

    super.initState();

    this.databaseHelper = DatabaseHelper();

    this.databaseHelper.setupDatabase().whenComplete(() async {

      insertData().
      whenComplete(() async {
        setState(() {

        });
      });

    });
  }


  Future<void> insertData() async {

    var vocabulary = new Vocabulary(2, "Efachisto", "Εφαψηιστο", "Thank you");
    await databaseHelper.insertVocabulary(vocabulary);
    vocabulary = new Vocabulary(3, "Kalimera", "Καλιμερα", "Good morning");
    await databaseHelper.insertVocabulary(vocabulary);



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
          child: FutureBuilder(future: databaseHelper.getVocabulary(), builder: (context, snapshot) {

            if(snapshot.hasData) {

              var vocEntryData = snapshot.data! as List<Vocabulary>;


              // col.verticalDirection = Axis.vertical;

              List<Widget> vocEntries = [];

              for (int i = 0; i < vocEntryData.length; i++) {

                vocEntries.add(Text("English Word: ${vocEntryData.elementAt(i).english_voc}" ));
                vocEntries.add(Text("Greek Word: ${vocEntryData.elementAt(i).greek_voc}" ));
                vocEntries.add(ElevatedButton(onPressed: () { setState(() { }); }, child: Text('Next Voc')));

              }



              var col = new Column(verticalDirection: VerticalDirection.down,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center, children: vocEntries);

              return col;


            } else {
              return Text("null value");;
            }
          }),

      ),
    );
  }

}



