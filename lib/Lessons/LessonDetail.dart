import 'dart:convert';

import 'package:flutter/material.dart';
import '../ScreenArguments.dart';
import '../model/vocModel.dart';
import '../res/vocData.dart';
import '../model/jsonStorage.dart';

class LessonDetail extends StatefulWidget {

  final ScreenArguments screenargument;

  const LessonDetail({Key? key,  required this.screenargument}) : super(key: key);


  @override
  State<StatefulWidget> createState() => _LessonDetailState(screenargument);

}

class _LessonDetailState extends State<LessonDetail> {

  late ScreenArguments screenargument;
  var index = 0;
  // String rawData;



  _LessonDetailState(ScreenArguments sa) {

    this.screenargument = sa;

  }

  Iterable parsedJson = json.decode(vocData.listOfAllVocs);


  _readFile() {

    // Parse JSON
    Iterable parsedJson = json.decode(vocData.listOfAllVocs);


  }

  @override
  Widget build(BuildContext context) {

    //vocList = List<vocModel>.from(parsedJson.map((e) => vocModel.fromJson(e)));
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
              Text('English Word:  ${vocList.elementAt(index).englishVoc}!'),
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



