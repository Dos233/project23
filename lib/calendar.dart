import 'package:project2ems_app/global_state.dart';
import 'package:flutter/material.dart';
import 'package:project2ems_app/managerHome.dart';

class Calendar extends StatelessWidget {
  @override
  Global_State _global_key = Global_State.instance;

  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          title: new Text('Calendar'),
          backgroundColor: Colors.green,
          automaticallyImplyLeading: true,
          leading: IconButton(
              icon: Icon(Icons.arrow_back_ios),
              onPressed: () {
                Navigator.pop(context);
              }),
        ),
      ),
    );
  }
}
