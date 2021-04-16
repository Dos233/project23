import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;
import 'package:progress_dialog/progress_dialog.dart';
import 'package:toast/toast.dart';

class ForgotPasswordPage extends StatefulWidget {
  @override
  _ForgotPasswordPageState createState() => _ForgotPasswordPageState();
}

class _ForgotPasswordPageState extends State<ForgotPasswordPage> {
  TextEditingController _emailEditingController = new TextEditingController();
  TextEditingController _passEditingController = new TextEditingController();

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
                  child: Text('Reset',
                      style: TextStyle(
                          fontSize: 80.0, fontWeight: FontWeight.bold)),
                ),
                Container(
                  padding: EdgeInsets.fromLTRB(15.0, 175.0, 0.0, 0.0),
                  child: Text('Password',
                      style: TextStyle(
                          fontSize: 80.0, fontWeight: FontWeight.bold)),
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
                        borderSide: BorderSide(color: Colors.green)),
                  ),
                ),
                SizedBox(height: 20.0),
                TextField(
                  controller: _passEditingController,
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.vpn_key),
                    labelText: 'New Password',
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
                SizedBox(height: 40.0),
                GestureDetector(
                  onTap: () {
                    _reset_password();
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
                          'Change Password',
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
                Container(
                  height: 40.0,
                  color: Colors.transparent,
                  child: Container(
                    decoration: BoxDecoration(
                        border: Border.all(
                            color: Colors.black,
                            style: BorderStyle.solid,
                            width: 1.0),
                        color: Colors.transparent,
                        borderRadius: BorderRadius.circular(20.0)),
                    child: InkWell(
                      onTap: () {
                        Navigator.of(context).pop();
                      },
                      child: Center(
                        child: Text('Cancel',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontFamily: 'Montserrat')),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void _reset_password() async {
    String _email = _emailEditingController.text;
    String _password = _passEditingController.text;

    ProgressDialog pr = ProgressDialog(context,
        type: ProgressDialogType.Normal, isDismissible: false);
    pr.style(message: "Resetting Password...");
    await pr.show();
    http.post("https://icebeary.com/EMS/forgot_password.php", body: {
      "email": _email,
      "password": _password,
    }).then((res) {
      print(res.body.contains);
      Navigator.of(context).pop();
      if (res.body.contains("register success")) {
        Toast.show(
          "Reset password success",
          context,
          duration: 4,
          gravity: Toast.BOTTOM,
        );
        Navigator.of(context).pop();
      } else {
        Toast.show(
          "Reset password failed. Not registered email.",
          context,
          duration: 4,
          gravity: Toast.BOTTOM,
        );
      }
    }).catchError((err) {
      print(err);
    });
    await pr.hide();
  }
}
