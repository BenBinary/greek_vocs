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

    const List<String> entries = <String>['A', 'B', 'C'];
    // const conIndex = entries.length

    return ListView.separated(
      padding: const EdgeInsets.all(5),
      itemCount: entries.length,
      itemBuilder: (BuildContext context, int index) {
        return Container(
            height: 50,
            color: Colors.amber[500],
            child: const Center(child: Text('Name of the User: ')),
        );
      },
      separatorBuilder: (BuildContext context, int index) => const Divider(),

    );


  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(
      title: const Text('User Profile and Statistics'),

    ),
    body:// _userProperties(),
        _userStatistics()
    //const Text('Hello'),
   // const MaterialBanner(content: Text('Hello'), actions: <Widget>[TextButton(onPressed: null, child: Text('Open'))])
    );
  }
}

