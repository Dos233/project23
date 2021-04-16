import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:project2ems_app/database_helper.dart';
import 'package:project2ems_app/find.dart';
import 'package:project2ems_app/managerHome.dart';

import 'package:project2ems_app/workerHome.dart';

class SelectPage extends StatefulWidget {
  @override
  _SelectPageState createState() => _SelectPageState();
}

class _SelectPageState extends State<SelectPage> {
  TextEditingController workername = TextEditingController();
  TextEditingController registerjob = TextEditingController();

  selectjob() {
    var url = "https://icebeary.com/EMS/addjob.php";
    http.post(url, body: {
      'workername': workername.text,
      'registerjob': registerjob.text,
    });
  }

  @override
  void initState() {
    workername = TextEditingController(text: '');
    registerjob = TextEditingController(text: '');

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: new Text('Select Job'),
          backgroundColor: Colors.green,
          automaticallyImplyLeading: true,
          leading: IconButton(
            icon: Icon(Icons.arrow_back_ios),
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => WorkerHomePage()));
            },
          ),
        ),
        body: ListView(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 4.0),
              child: TextField(
                controller: workername,
                decoration: InputDecoration(
                    labelText: "Your Name",
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10))),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 4.0),
              child: TextField(
                controller: registerjob,
                decoration: InputDecoration(
                    labelText: "Job Name",
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10))),
              ),
            ),
            Row(
              children: <Widget>[
                Expanded(
                  child: RaisedButton(
                    child: Text(
                      "Register Job",
                      style: TextStyle(color: Colors.white),
                    ),
                    onPressed: () {
                      setState(() {
                        selectjob();
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => WorkerHomePage()));
                      });
                    },
                    color: Colors.green,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 5, right: 5),
                ),
                Expanded(
                  child: RaisedButton(
                    child: Text(
                      "Cancel",
                      style: TextStyle(color: Colors.white),
                    ),
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => WorkerHomePage()));
                    },
                    color: Colors.blue,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 5, right: 5),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
