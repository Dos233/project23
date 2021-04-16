import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:project2ems_app/global_state.dart';
import 'package:flutter/material.dart';
import 'package:project2ems_app/managerHome.dart';

class WorkerDetails extends StatelessWidget {
  @override
  Global_State _global_key = Global_State.instance;

  Widget build(BuildContext context) {
    return MaterialApp(
      title: "",
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyWorkerDetailsPage(),
    );
  }
}

class MyWorkerDetailsPage extends StatefulWidget {
  @override
  _MyWorkerDetailsPageState createState() => _MyWorkerDetailsPageState();
}

class _MyWorkerDetailsPageState extends State<MyWorkerDetailsPage> {
  Future getData() async {
    var url = "https://icebeary.com/EMS/load_job.php";
    var response = await http.get(url);
    return json.decode(response.body);
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          title: new Text('Worker Details'),
          backgroundColor: Colors.green,
          automaticallyImplyLeading: true,
          leading: IconButton(
              icon: Icon(Icons.arrow_back_ios),
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => ManagerHomePage()));
              }),
        ),
        body: FutureBuilder(
            future: getData(),
            builder: (context, snapshot) {
              if (snapshot.hasError) print(snapshot.error);
              return snapshot.hasData
                  ? ListView.builder(
                      itemCount: snapshot.data.length,
                      itemBuilder: (context, index) {
                        List list = snapshot.data;
                        return ListTile(
                          leading: GestureDetector(
                            child: Icon(Icons.accessibility_new),
                          ),
                          title: Text(
                            list[index]['workername'],
                          ),
                          subtitle: Text(list[index]['registerjob']),
                        );
                      })
                  : CircularProgressIndicator();
            }),
      ),
    );
  }
}
