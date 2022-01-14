import 'package:flutter/material.dart';

class UserStat extends StatefulWidget {
  const UserStat({Key? key}) : super(key: key);

  @override
  _UserStatState createState() => _UserStatState();
}

class _UserStatState extends State<UserStat> {

  Widget _userProperties() {

    return ListView.builder(itemBuilder: (context, i) {
      
      return MaterialBanner(content: Text('Tach'), actions: <Widget>[TextButton(onPressed: null, child: Text('Open'))]);

    });
  }

  Widget _userStatistics() {

    final lv = ListView(
      padding: const EdgeInsets.all(5),
      children: [Container(
        height: 50,
        color: Colors.amber[500],
        child: const Center(child: Text('Stat 1')),
      ), Container(
          height: 50,
          color: Colors.amber[600],
          child: const Center(child: Text('Stat 1')),
        ), Container(
        height: 50,
        color: Colors.amber[700],
        child: const Center(child: Text('Stat 1')),
      ),
      ],
    );

    return lv;

  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(
      title: const Text('User Profile'),

    ),
    body:// _userProperties(),
        _userStatistics()
    //const Text('Hello'),
   // const MaterialBanner(content: Text('Hello'), actions: <Widget>[TextButton(onPressed: null, child: Text('Open'))])
    );
  }
}

