import 'package:project2ems_app/calendar.dart';
import 'package:project2ems_app/database_helper.dart';
import 'package:project2ems_app/details.dart';
import 'package:project2ems_app/find.dart';
import 'package:project2ems_app/global_state.dart';
import 'package:project2ems_app/history.dart';

import 'package:project2ems_app/jobdetails.dart';
import 'package:project2ems_app/login.dart';
import 'package:project2ems_app/sharelivelocation.dart';
// import 'package:ems_app/sharelivelocation.dart';
// import 'package:ems_app/wagescalculator.dart';
import 'package:flutter/material.dart';

class WorkerHomePage extends StatelessWidget {
  Global_State _global_key = Global_State.instance;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
            backgroundColor: Colors.green,
            title: new Text('Worker Home'),
            actions: <Widget>[
              Padding(
                padding: EdgeInsets.only(right: 25.0),
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Calendar()));
                  },
                  child: Icon(Icons.calendar_today),
                ),
              ),
            ]),
        drawer: new Drawer(
          child: ListView(
            children: <Widget>[
              Container(
                child: new UserAccountsDrawerHeader(
                  decoration: BoxDecoration(
                    color: Colors.green,
                  ),
                  accountName: new Text("${_global_key.user_list[0]["name"]}"),
                  accountEmail:
                      new Text("${_global_key.user_list[0]["email"]}"),
                  currentAccountPicture: new CircleAvatar(
                    backgroundImage:
                        new NetworkImage('https://i.pravatar.cc/300'),
                  ),
                ),
              ),
              new ListTile(
                leading: Icon(
                  Icons.location_on,
                  color: Colors.black,
                ),
                title: new Text('Share Live Location'),
                onTap: () {
                  Navigator.of(context).pop();
                  Navigator.push(
                      context,
                      new MaterialPageRoute(
                          builder: (BuildContext context) =>
                              new ShareliveLocation()));
                },
              ),
              new Divider(
                color: Colors.green,
                height: 5.0,
              ),
              new ListTile(
                leading: Icon(
                  Icons.calculate,
                  color: Colors.black,
                ),
                title: new Text('History'),
                onTap: () {
                  Navigator.of(context).pop();
                  Navigator.push(
                      context,
                      new MaterialPageRoute(
                          builder: (BuildContext context) => new History()));
                },
              ),
              new Divider(
                color: Colors.green,
                height: 5.0,
              ),
              new ListTile(
                leading: Icon(
                  Icons.home,
                  color: Colors.black,
                ),
                title: new Text('Logout'),
                onTap: () {
                  Navigator.of(context).pop();
                  Navigator.push(
                      context,
                      new MaterialPageRoute(
                          builder: (BuildContext context) => new LoginPage()));
                },
              ),
              new Divider(
                color: Colors.green,
                height: 5.0,
              ),
            ],
          ),
        ),
        body: MyWorkerHomePage(),
      ),
    );
  }
}

class MyWorkerHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var db = new DatabaseHelper();
    return Padding(
      padding: EdgeInsets.all(10),
      child: FutureBuilder<List>(
        future: db.findAll(),
        builder: (context, AsyncSnapshot<List> snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
                itemCount: snapshot.data.length,
                itemBuilder: (context, index) {
                  Find find = Find.fromJson(snapshot.data[index]);
                  return Card(
                    child: ListTile(
                      title: Text(find.jobname),
                      subtitle: Text(find.date),
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => JobDetailsPage(
                                      find: find,
                                    )));
                      },
                    ),
                  );
                });
          } else {
            return CircularProgressIndicator();
          }
        },
      ),
    );
  }
}
