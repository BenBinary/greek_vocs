import 'dart:convert';

import 'package:flutter/material.dart';
import '../ScreenArguments.dart';
import '../model/vocModel.dart';
import '../res/vocData.dart';

class LessonDetail extends StatefulWidget {

  final ScreenArguments screenargument;

  const LessonDetail({Key? key,  required this.screenargument}) : super(key: key);


  @override
  State<StatefulWidget> createState() => _LessonDetailState(screenargument);

}

class _LessonDetailState extends State<LessonDetail> {


  late ScreenArguments screenargument;


  _LessonDetailState(ScreenArguments sa) {

    this.screenargument = sa;

  }

  @override
  Widget build(BuildContext context) {


    // Parse JSON
    Iterable parsedJson = json.decode(vocData.listOfAllVocs);
    Map<String, dynamic> user = jsonDecode(vocData.test);

    List<vocModel> vocList = List<vocModel>.from(parsedJson.map((e) => vocModel.fromJson(e)));

    var index = 0;

    var v = vocList.elementAt(index);

    var currentGreekVoc = v.greekVoc;
    var currentEnglishVoc = v.englishVoc;

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
              Text('English Word:  ${currentEnglishVoc}!'),
              Text('Greek Word: ${currentGreekVoc}!'),
              ElevatedButton(onPressed: () {}, child: const Text('Previos Word')),
              ElevatedButton(onPressed: () {

                index = index + 1;
                currentEnglishVoc = vocList.elementAt(index).englishVoc;
                currentGreekVoc = vocList.elementAt(index).greekVoc;

              }, child: const Text('Next Word')),
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



