import 'package:flutter/material.dart';
import 'package:toppinthong/utility/style.dart';
import 'package:intl/intl.dart';

class Register extends StatefulWidget {
  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  //Field

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
          helperText: 'กรุณาพิมพ์ชื่อ',
          helperStyle: MyStyle().txtStyle600h,
          hintText: 'ภาษาไทยเท่านั้น',
        ),
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
        decoration: InputDecoration(
          icon: Icon(
            Icons.account_box,
            size: 36.0,
            color: Colors.yellow,
          ),
          labelText: 'Username :',
          labelStyle: MyStyle().txtStyle600,
          helperText: 'กรุณาพิมพ์ชื่อเข้าระบบ',
          helperStyle: MyStyle().txtStyle600h,
          hintText: 'ภาษาอังกฤษเท่านั้น',
        ),
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
          hintText: 'มากกว่า 6 ตัวอักษร',
        ),
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
      onPressed: () {},
    );
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
    );
  }
}
