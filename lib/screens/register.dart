import 'dart:convert';
import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:toppinthong/utility/style.dart';
import 'package:intl/intl.dart';

class Register extends StatefulWidget {
  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  //Field
  final keyForm = GlobalKey<FormState>();
  String name, user, password;

  //Method
  Widget nameText() {
    return Container(
      margin: EdgeInsets.only(
        left: 30.0,
        right: 30.0,
      ),
      child: TextFormField(
        decoration: InputDecoration(
          icon: Icon(
            Icons.face,
            size: 36.0,
            color: Colors.orange,
          ),
          labelText: 'Display Name :',
          labelStyle: MyStyle().txtStyle600,
          helperText: 'พิมพ์ชื่อ',
          helperStyle: MyStyle().txtStyle600h,
          hintText: 'ภาษาไทยเท่านั้น',
        ),
        validator: (String value) {
          if (value.isEmpty) {
            return 'กรุณาพิมพ์ชื่อ';
          } else {
            return null;
          }
        },
        onSaved: (value) {
          name = value.trim();
        },
      ),
    );
  }

  //Method
  Widget userText() {
    return Container(
      margin: EdgeInsets.only(
        left: 30.0,
        right: 30.0,
      ),
      child: TextFormField(
        keyboardType: TextInputType.emailAddress,
        decoration: InputDecoration(
          icon: Icon(
            Icons.account_box,
            size: 36.0,
            color: Colors.yellow,
          ),
          labelText: 'Username :',
          labelStyle: MyStyle().txtStyle600,
          helperText: 'พิมพ์อีเมลเพื่อเข้าระบบ',
          helperStyle: MyStyle().txtStyle600h,
          hintText: 'ภาษาอังกฤษเท่านั้น',
        ),
        validator: (String value) {
          if (value.isEmpty) {
            return 'กรุณาพิมพ์อีเมลเพื่อเข้าระบบ';
          } else if (!((value.contains('@')) && (value.contains('.')))) {
            return 'กรุณากรกอกอีเมลให้ถูกต้อง';
          } else {
            return null;
          }
        },
        onSaved: (value) {
          user = value.trim();
        },
      ),
    );
  }

  //Method
  Widget passwordText() {
    return Container(
      margin: EdgeInsets.only(
        left: 30.0,
        right: 30.0,
      ),
      child: TextFormField(
        obscureText: true,
        decoration: InputDecoration(
          icon: Icon(
            Icons.lock,
            size: 36.0,
            color: Colors.red,
          ),
          labelText: 'Password :',
          labelStyle: MyStyle().txtStyle600,
          helperText: 'กรุณาพิมพ์รหัสผ่าน',
          helperStyle: MyStyle().txtStyle600h,
          hintText: 'ตั้งแต่ 6 ตัวอักษรขึ้นไป',
        ),
        validator: (value) {
          if (value.length < 6) {
            return 'ต้องมีตัวอักษรตั้งแต่ 6 ตัวขึ้นไป';
          } else {
            return null;
          }
        },
        onSaved: (value) {
          password = value.trim();
        },
      ),
    );
  }

  Widget showCurrentDate() {
    DateTime dateTime = DateTime.now();
    String dateFomat = DateFormat('yyyy-MM-dd HH:mm:ss').format(dateTime);
    // print('$dateFomat');
    return Text(
      'Date = $dateFomat',
      style: MyStyle().txtStyle900,
    );
  }

  Widget registerButton() {
    return IconButton(
      tooltip: 'ยืนยันการสมัคร',
      icon: Icon(Icons.check),
      onPressed: () {
        // print('Submit');
        if (keyForm.currentState.validate()) {
          // print('OK');
          keyForm.currentState.save();
          // print('name= $name,user= $user,password= $password');
          registerThread();
        }
      },
    );
  }

  Future<void> registerThread() async {
    String url =
        'https://www.androidthai.in.th/pint/addDataTop.php?isAdd=true&name=$name&user=$user&password=$password';
    Response response = await get(url);

    var result = json.decode(response.body);
    // print('$result');

    if (result.toString() == 'true') {
      Navigator.of(context).pop();
    } else {

    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: MyStyle().btColor,
        title: Text('Register'),
        actions: <Widget>[registerButton()],
      ),
      body: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
          colors: [Colors.white, Colors.white, MyStyle().bdColor],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        )),
        child: Form(
          key: keyForm,
          child: ListView(
            padding: EdgeInsets.all(30.0),
            children: <Widget>[
              showCurrentDate(),
              SizedBox(
                height: 20.0,
              ),
              nameText(),
              userText(),
              passwordText(),
            ],
          ),
        ),
      ),
    );
  }
}
