import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;
import 'package:progress_dialog/progress_dialog.dart';
import 'package:project2ems_app/forgotPassword.dart';
import 'package:project2ems_app/managerHome.dart';
import 'package:project2ems_app/workerHome.dart';
import 'package:toast/toast.dart';
import 'dart:convert';
import 'package:project2ems_app/global_state.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginState createState() => new _LoginState();
}

class _LoginState extends State<LoginPage> {
  TextEditingController _emailEditingController = new TextEditingController();
  TextEditingController _passEditingController = new TextEditingController();

  Global_State _global_key = Global_State.instance;

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      resizeToAvoidBottomInset: false,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            child: Stack(
              children: <Widget>[
                Container(
                  padding: EdgeInsets.fromLTRB(15.0, 110.0, 0.0, 0.0),
                  child: Text('Welcome',
                      style: TextStyle(
                          fontSize: 50.0, fontWeight: FontWeight.bold)),
                ),
                Container(
                  padding: EdgeInsets.fromLTRB(15.0, 175.0, 0.0, 0.0),
                  child: Text('EMS ',
                      style: TextStyle(
                          fontSize: 50.0, fontWeight: FontWeight.bold)),
                ),
                Container(
                  padding: EdgeInsets.fromLTRB(120.0, 120.0, 0.0, 0.0),
                  child: Text('.',
                      style: TextStyle(
                          fontSize: 80.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.green)),
                ),
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.only(top: 35.0, left: 20.0, right: 20.0),
            child: Column(
              children: <Widget>[
                TextField(
                  controller: _emailEditingController,
                  decoration: InputDecoration(
                      prefixIcon: Icon(Icons.email),
                      labelText: 'EMAIL',
                      labelStyle: TextStyle(
                          fontFamily: 'Montserrat',
                          fontWeight: FontWeight.bold,
                          color: Colors.grey),
                      focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.green))),
                ),
                SizedBox(height: 20.0),
                TextField(
                  controller: _passEditingController,
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.vpn_key),
                    suffixIcon: Icon(Icons.visibility),
                    labelText: 'Password',
                    labelStyle: TextStyle(
                        fontFamily: 'Montserrat',
                        fontWeight: FontWeight.bold,
                        color: Colors.grey),
                    focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.green)),
                  ),
                  obscureText: true,
                ),
                SizedBox(
                  height: 5.0,
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ForgotPasswordPage()));
                  },
                  child: Container(
                    alignment: Alignment(1.0, 0.0),
                    padding: EdgeInsets.only(top: 15.0, left: 20.0),
                    child: Text(
                      'Forgot Password',
                      style: TextStyle(
                          color: Colors.green,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Montserrat',
                          decoration: TextDecoration.underline),
                    ),
                  ),
                ),
                SizedBox(height: 40.0),
                GestureDetector(
                  onTap: () {
                    _login();
                  },
                  child: Container(
                    height: 40.0,
                    child: Material(
                      borderRadius: BorderRadius.circular(20.0),
                      shadowColor: Colors.greenAccent,
                      color: Colors.green,
                      elevation: 7.0,
                      child: Center(
                        child: Text(
                          'LOGIN',
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'Montserrat'),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 30.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      'New Worker ?',
                      style: TextStyle(fontFamily: 'Montserrat'),
                    ),
                    SizedBox(width: 8.0),
                    InkWell(
                      onTap: () {
                        Navigator.of(context).pushNamed('/signup');
                      },
                      child: Text(
                        'Register',
                        style: TextStyle(
                            color: Colors.green,
                            fontFamily: "Montserrat",
                            fontWeight: FontWeight.bold,
                            decoration: TextDecoration.underline),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void _login() async {
    String _email = _emailEditingController.text;
    String _password = _passEditingController.text;
    ProgressDialog pr = ProgressDialog(context,
        type: ProgressDialogType.Normal, isDismissible: false);
    pr.style(message: "Logging In...");
    await pr.show();
    http.post("https://icebeary.com/EMS/login.php", body: {
      "email": _email,
      "password": _password,
    }).then((res) {
      print(res.body);
      if (res.body == 'failed') {
        Toast.show(
          "No Registed Account",
          context,
          duration: 2,
          gravity: Toast.BOTTOM,
        );
      } else {
        var USERJSCODE = json.decode(res.body);
        _global_key.user_list = USERJSCODE['user'];
        //_global_key.password = _password;
        if (_global_key.user_list[0]["role"] == "worker") {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => WorkerHomePage()));
        } else {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => ManagerHomePage()));
        }
      }
    }).catchError((err) {
      print(err);
    });
    await pr.hide();
  }
}
