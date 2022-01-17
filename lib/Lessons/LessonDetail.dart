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
    body: SafeArea(
      child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Image.asset('images/pic2.jpg'),
          Image.asset('images/pic3.jpg'),

          ElevatedButton(
              onPressed: ()
              {
                Navigator.pop(context);
              },
              child: const Text('go back')),
        ],
      )

    ),
    );
  }
}



