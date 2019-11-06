import 'package:flutter/material.dart';
import 'package:toppinthong/screens/register.dart';
import 'package:toppinthong/utility/style.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  // Field

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
        onPressed: () {},
      ),
    );
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
        decoration: InputDecoration(labelText: 'User :'),
      ),
    );
  }

  Widget passWord() {
    return Container(
      width: 250.0,
      child: TextFormField(
        obscureText: true,
        decoration: InputDecoration(labelText: 'Password :'),
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
    );
  }
}
