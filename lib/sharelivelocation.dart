import 'package:project2ems_app/global_state.dart';
import 'package:flutter/material.dart';

class ShareliveLocation extends StatelessWidget {
  @override
  Global_State _global_key = Global_State.instance;

  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          title: new Text('Share Live Location'),
          backgroundColor: Colors.green,
          automaticallyImplyLeading: true,
          leading: IconButton(
              icon: Icon(Icons.arrow_back_ios),
              onPressed: () {
                if (_global_key.user_list[0]["role"] == "worker") {
                  Navigator.of(context).pushReplacementNamed('/workerHome');
                } else {
                  Navigator.of(context).pushReplacementNamed('/managerHome');
                }
              }),
        ),
      ),
    );
  }
}
