import 'package:project2ems_app/global_state.dart';
import 'package:flutter/material.dart';

class History extends StatelessWidget {
  @override
  Global_State _global_key = Global_State.instance;

  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          title: new Text('History'),
          backgroundColor: Colors.green,
          automaticallyImplyLeading: true,
          leading:
              IconButton(icon: Icon(Icons.arrow_back_ios), onPressed: () {}),
        ),
      ),
    );
  }
}
