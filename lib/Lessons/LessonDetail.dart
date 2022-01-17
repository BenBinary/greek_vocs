import 'package:flutter/material.dart';
import '../ScreenArguments.dart';

class LessonDetail extends StatelessWidget {

  const LessonDetail({Key? key, required this.screenargument}) : super(key: key);
  final ScreenArguments screenargument;

  @override
  Widget build(BuildContext context) {
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
          Text('English Word: '),
          Text('Greek Word: '),
          ElevatedButton(onPressed: () {}, child: const Text('Previos Word')),
          ElevatedButton(onPressed: () {}, child: const Text('Next Word')),
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



