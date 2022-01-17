import 'package:flutter/material.dart';

class LessonDetail extends StatelessWidget {
  const LessonDetail({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Details'),
      ),
    body: Center(
      child: ElevatedButton(
        onPressed: ()
          {
            Navigator.pop(context);
          },
          child: const Text('go back'),
    )
    ),
    );
  }
}



