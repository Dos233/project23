import 'package:flutter/material.dart';
import 'package:project2ems_app/calendar.dart';
import 'package:project2ems_app/database_helper.dart';
import 'package:project2ems_app/find.dart';
import 'package:project2ems_app/managerHome.dart';

class EditPage extends StatefulWidget {
  Find find;

  EditPage({Key key, this.find}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return new EditPageState();
  }
}

class EditPageState extends State<EditPage> {
  var TextEditingControllerjobname = new TextEditingController();
  var TextEditingControllerjobdes = new TextEditingController();
  var TextEditingControllerwagesperhour = new TextEditingController();
  var TextEditingControllerdate = new TextEditingController();
  var TextEditingControllerduration = new TextEditingController();
  var TextEditingControllerworkhour = new TextEditingController();
  var TextEditingControllernumberofworkers = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    TextEditingControllerjobname.text = widget.find.jobname;
    TextEditingControllerjobdes.text = widget.find.jobdes;
    TextEditingControllerwagesperhour.text = widget.find.wagesperhour;
    TextEditingControllerdate.text = widget.find.date;
    TextEditingControllerduration.text = widget.find.duration;
    TextEditingControllerworkhour.text = widget.find.workhour;
    TextEditingControllernumberofworkers.text = widget.find.numberofworkers;

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: new Text('Edit Job'),
          backgroundColor: Colors.green,
          automaticallyImplyLeading: true,
          leading: IconButton(
            icon: Icon(Icons.arrow_back_ios),
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => ManagerHomePage()));
            },
          ),
          actions: <Widget>[
            Padding(
              padding: EdgeInsets.only(right: 15.0),
              child: GestureDetector(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Calendar()));
                },
                child: Icon(Icons.calendar_today),
              ),
            ),
          ],
        ),
        body: ListView(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 4.0),
              child: TextField(
                controller: TextEditingControllerjobname,
                decoration: InputDecoration(
                    labelText: "Job Name",
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10))),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 4.0),
              child: TextField(
                controller: TextEditingControllerjobdes,
                maxLines: 5,
                decoration: InputDecoration(
                    labelText: "Job Description",
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10))),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 4.0),
              child: TextField(
                controller: TextEditingControllerwagesperhour,
                decoration: InputDecoration(
                    labelText: "Wages Per Hour",
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10))),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 4.0),
              child: TextField(
                controller: TextEditingControllerdate,
                decoration: InputDecoration(
                    labelText: "Date",
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10))),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 4.0),
              child: TextField(
                controller: TextEditingControllerduration,
                decoration: InputDecoration(
                    labelText: "Duration",
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10))),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 4.0),
              child: TextField(
                controller: TextEditingControllerworkhour,
                decoration: InputDecoration(
                    labelText: "Working Hour",
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10))),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 4.0),
              child: TextField(
                controller: TextEditingControllernumberofworkers,
                decoration: InputDecoration(
                    labelText: "Number of Worker Needed",
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10))),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(10),
            ),
            Row(
              children: <Widget>[
                Expanded(
                  child: RaisedButton(
                    child: Text(
                      "Save",
                      style: TextStyle(color: Colors.white),
                    ),
                    onPressed: () async {
                      widget.find.jobname = TextEditingControllerjobname.text;
                      widget.find.jobdes = TextEditingControllerjobdes.text;
                      widget.find.wagesperhour =
                          TextEditingControllerwagesperhour.text;
                      widget.find.date = TextEditingControllerdate.text;
                      widget.find.duration = TextEditingControllerduration.text;
                      widget.find.workhour = TextEditingControllerworkhour.text;
                      widget.find.numberofworkers =
                          TextEditingControllernumberofworkers.text;

                      var db = DatabaseHelper();
                      await db.update(widget.find);
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ManagerHomePage()));
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
                              builder: (context) => ManagerHomePage()));
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
