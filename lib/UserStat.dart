import 'package:flutter/material.dart';

class UserStat extends StatefulWidget {
  const UserStat({Key? key}) : super(key: key);

  @override
  _UserStatState createState() => _UserStatState();
}

class _UserStatState extends State<UserStat> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(
      title: const Text('User Profile'),
    ));
  }
}

