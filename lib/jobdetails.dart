import 'package:flutter/material.dart';
import 'package:project2ems_app/calendar.dart';
import 'package:project2ems_app/find.dart';
import 'package:project2ems_app/select.dart';
import 'package:project2ems_app/workerHome.dart';

//worker view their job details to select their job

class JobDetailsPage extends StatefulWidget {
  Find find;

  JobDetailsPage({Key key, this.find}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return new JobDetailsPageState();
  }
}

class JobDetailsPageState extends State<JobDetailsPage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          title: new Text('Job Details'),
          backgroundColor: Colors.green,
          automaticallyImplyLeading: true,
          leading: IconButton(
            icon: Icon(Icons.arrow_back_ios),
            onPressed: () {
              Navigator.pop(context);
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
        body: Padding(
          padding: EdgeInsets.all(10),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  "Job Name",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(10),
                ),
                Text(widget.find.jobname),
                Padding(
                  padding: EdgeInsets.all(10),
                ),
                Text(
                  "Job Descriptiom",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(10),
                ),
                Text(widget.find.jobdes),
                Padding(
                  padding: EdgeInsets.all(10),
                ),
                Text(
                  "Wages Per Hour",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(10),
                ),
                Text(widget.find.wagesperhour),
                Padding(
                  padding: EdgeInsets.all(10),
                ),
                Text(
                  "Date",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(10),
                ),
                Text(widget.find.date),
                Padding(
                  padding: EdgeInsets.all(10),
                ),
                Text(
                  "Duration",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(10),
                ),
                Text(widget.find.duration),
                Padding(
                  padding: EdgeInsets.all(10),
                ),
                Text(
                  "Working Hour",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(10),
                ),
                Text(widget.find.workhour),
                Padding(
                  padding: EdgeInsets.all(10),
                ),
                Text(
                  "Number of Worker Needed",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(10),
                ),
                Text(widget.find.numberofworkers),
                Padding(
                  padding: EdgeInsets.all(10),
                ),
                Row(
                  children: <Widget>[
                    Expanded(
                      child: RaisedButton(
                        child: Text(
                          "Select",
                          style: TextStyle(color: Colors.white),
                        ),
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => SelectPage()));
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
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
