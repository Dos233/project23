import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:progress_dialog/progress_dialog.dart';
import 'package:toast/toast.dart';

class SignupPage extends StatefulWidget {
  @override
  _SignupPageState createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  TextEditingController _nameEditingController = new TextEditingController();
  TextEditingController _emailEditingController = new TextEditingController();
  TextEditingController _phoneEditingController = new TextEditingController();
  TextEditingController _passEditingController = new TextEditingController();
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
                      child: Text(
                        'Signup',
                        style: TextStyle(
                            fontSize: 80.0, fontWeight: FontWeight.bold),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.fromLTRB(260.0, 125.0, 0.0, 0.0),
                      child: Text(
                        '.',
                        style: TextStyle(
                            fontSize: 80.0,
                            fontWeight: FontWeight.bold,
                            color: Colors.green),
                      ),
                    )
                  ],
                ),
              ),
              Container(
                  padding: EdgeInsets.only(top: 35.0, left: 20.0, right: 20.0),
                  child: Column(
                    children: <Widget>[
                      TextField(
                        controller: _nameEditingController,
                        decoration: InputDecoration(
                            prefixIcon: Icon(Icons.person),
                            labelText: 'ID Name',
                            labelStyle: TextStyle(
                                fontFamily: 'Montserrat',
                                fontWeight: FontWeight.bold,
                                color: Colors.grey),
                            // hintText: 'EMAIL',
                            // hintStyle: ,
                            focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.green))),
                      ),
                      SizedBox(height: 10.0),
                      TextField(
                        controller: _emailEditingController,
                        decoration: InputDecoration(
                            prefixIcon: Icon(Icons.email),
                            labelText: 'Email ',
                            labelStyle: TextStyle(
                                fontFamily: 'Montserrat',
                                fontWeight: FontWeight.bold,
                                color: Colors.grey),
                            focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.green))),
                      ),
                      SizedBox(height: 10.0),
                      TextField(
                        controller: _phoneEditingController,
                        keyboardType: TextInputType.phone,
                        decoration: InputDecoration(
                            prefixIcon: Icon(Icons.phone_android),
                            labelText: 'Phone ',
                            labelStyle: TextStyle(
                                fontFamily: 'Montserrat',
                                fontWeight: FontWeight.bold,
                                color: Colors.grey),
                            focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.green))),
                      ),
                      SizedBox(height: 10.0),
                      TextField(
                        controller: _passEditingController,
                        decoration: InputDecoration(
                            prefixIcon: Icon(Icons.vpn_key),
                            suffixIcon: Icon(Icons.visibility),
                            labelText: 'Password ',
                            labelStyle: TextStyle(
                                fontFamily: 'Montserrat',
                                fontWeight: FontWeight.bold,
                                color: Colors.grey),
                            focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.green))),
                        obscureText: true,
                      ),
                      SizedBox(height: 50.0),
                      Container(
                          height: 40.0,
                          child: RaisedButton(
                            onPressed: () {
                              _register();
                              Navigator.of(context).pop();
                            },
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                            //borderRadius: BorderRadius.circular(20.0),
                            //shadowColor: Colors.greenAccent,
                            color: Colors.green,
                            elevation: 7.0,
                            child: Center(
                              child: Text(
                                'SIGNUP',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontFamily: 'Montserrat'),
                              ),
                            ),
                          )),
                      SizedBox(height: 20.0),
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
                  )),
            ]));
  }

  //register
  void _register() async {
    String _name = _nameEditingController.text;
    String _email = _emailEditingController.text;
    String _phone = _phoneEditingController.text;
    String _password = _passEditingController.text;

    ProgressDialog pr = ProgressDialog(context,
        type: ProgressDialogType.Normal, isDismissible: false);
    pr.style(message: "Registration...");
    await pr.show();
    http.post("https://icebeary.com/EMS/signup.php", body: {
      "name": _name,
      "email": _email,
      "phone": _phone,
      "password": _password,
    }).then((res) {
      print(res.body.contains);
      if (res.body.contains("success")) {
        Navigator.of(context).pop();
        Toast.show(
          "Registration success. An email has been sent to .$_email. Please check your email for OTP verification. Also check in your spam folder.",
          context,
          duration: Toast.LENGTH_LONG,
          gravity: Toast.BOTTOM,
        );
      } else {
        Toast.show(
          "Registration failed",
          context,
          duration: Toast.LENGTH_LONG,
          gravity: Toast.BOTTOM,
        );
      }
    }).catchError((err) {
      print(err);
    });
    await pr.hide();
  }
}
