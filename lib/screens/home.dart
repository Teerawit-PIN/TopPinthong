import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:toppinthong/screens/register.dart';
import 'package:toppinthong/utility/alert.dart';
import 'package:toppinthong/utility/style.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  // Field
  final formKey = GlobalKey<FormState>();
  String user, password;

  // Method
  Widget signInButton() {
    return Expanded(
      child: RaisedButton(
        shape: MyStyle().btStyle,
        color: MyStyle().btColor,
        child: Text(
          'เข้าสู้ระบบ',
          style: MyStyle().btTxtStyle,
        ),
        onPressed: () {
          formKey.currentState.save();
          // print('$user+$password');
          checkAuthen();
        },
      ),
    );
  }

  Future<void> checkAuthen() async {
    if (user.isEmpty) {
      nomalDaialog(context, 'ยังไม่ได้กรอกอีเมล', 'กรุณากรอกอีเมล');
    } else if (password.isEmpty) {
      nomalDaialog(context, 'ยังไม่ได้กรอกรหัสผ่าน', 'กรุณากรอกรหัสผ่าน');
    }else{

    }
    
  }

  Widget signUpButton() {
    return Expanded(
      child: OutlineButton(
        shape: MyStyle().btStyle,
        borderSide: BorderSide(color: MyStyle().bdColor),
        color: MyStyle().btColor,
        child: Text(
          'สมัครสมาชิก',
          style: MyStyle().bdTxtStyle,
        ),
        onPressed: () {
          // print('Sign Up');

          // Create Route Arrow Back
          MaterialPageRoute materialPageRoute =
              MaterialPageRoute(builder: (BuildContext contaxt) {
            return Register();
          });
          Navigator.of(context).push(materialPageRoute);
        },
      ),
    );
  }

  Widget showButton() {
    return Container(
      width: 250.0,
      child: Row(
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          signUpButton(),
          SizedBox(
            width: 4.0,
          ),
          signInButton(),
        ],
      ),
    );
  }

  Widget userText() {
    return Container(
      width: 250.0,
      child: TextFormField(
        style: TextStyle(color: MyStyle().btColor),
        decoration: InputDecoration(
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.red),
          ),
          enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: MyStyle().btColor),
          ),
          labelText: 'User :',
          labelStyle: MyStyle().txtStyle600,
        ),
        onSaved: (value) {
          user = value.trim();
        },
      ),
    );
  }

  Widget passWord() {
    return Container(
      width: 250.0,
      child: TextFormField(
        style: TextStyle(color: MyStyle().btColor),
        obscureText: true,
        decoration: InputDecoration(
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.red),
          ),
          enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: MyStyle().btColor),
          ),
          labelText: 'Password :',
          labelStyle: MyStyle().txtStyle600,
        ),
        onSaved: (value) {
          password = value.trim();
        },
      ),
    );
  }

  Widget showLogo() {
    return Container(
      width: 300.0,
      // height: 40.0,
      child: Image.asset('images/logo.png'),
    );
  }

  Widget showAppName() {
    return Text(
      'เข้าสู่ระบบ',
      style: TextStyle(
        fontSize: MyStyle().h1,
        fontWeight: FontWeight.bold,
        fontStyle: FontStyle.italic,
        color: MyStyle().txt900,
        fontFamily: MyStyle().nameFont,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('images/background.jpg'),
                  fit: BoxFit.cover)),
          child: Center(
            child: Container(
              padding: MyStyle().padding20,
              color: MyStyle().bgColor,
              child: Form(
                key: formKey,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    showLogo(),
                    showAppName(),
                    userText(),
                    passWord(),
                    SizedBox(
                      height: 8.0,
                    ),
                    showButton(),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
