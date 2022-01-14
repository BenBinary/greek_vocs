import 'package:flutter/material.dart';

class Lessons extends StatelessWidget {
  const Lessons({Key? key}) : super(key: key);


  Widget _singleTopic() {
        // Container c = Container()
        return MaterialBanner(
            content: Text('Tach'),
            actions: <Widget>[TextButton(onPressed: null, child: Text('Open'))]);

  }


  Widget _lessonsTopic() {

    final List<String> entries = <String>['Food', 'Travelling', 'Study'];
    final List<int> colorCodes = <int>[600, 500, 100];

    ListView lv = ListView.separated(
      padding: const EdgeInsets.all(8),
      itemCount: entries.length,
      itemBuilder: (BuildContext context, int index) {
        return Container(
          height: 70,
          color: Colors.lightBlue[colorCodes[index]],
          child: Center(child: Text('Topic ${entries[index]}'),

          ),
        );
      },
      separatorBuilder: (BuildContext context, int index) => const Divider(),
    );

    return lv;

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(
      title: const Text('Lessons')
    ),
      body: _lessonsTopic(),
    );
  }
}
