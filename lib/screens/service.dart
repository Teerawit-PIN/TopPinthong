import 'package:flutter/material.dart';
import 'package:toppinthong/models/user_top.dart';
import 'package:toppinthong/widget/page1.dart';
import 'package:toppinthong/widget/page2.dart';
import 'package:toppinthong/widget/page3.dart'; //1 import

//2 create stateful
class MyService extends StatefulWidget {
  final UserModel userModel;

  MyService({Key key, this.userModel}) : super(key: key);

  @override
  _MyServiceState createState() => _MyServiceState();
}

class _MyServiceState extends State<MyService> {
  // field
  UserModel myUserModel;

  Widget currentWidget = Page1();

  // Medthod
   Widget menuPage3() {
    return ListTile(
      leading: Icon(
        Icons.filter_3,
        size: 36.0,
        color: Colors.blue,
      ),
      title: Text('Page 3'),
      subtitle: Text('Detail Page 3'),
      onTap: (){
        setState(() {
          currentWidget = Page3();
        });
        Navigator.of(context).pop();
      },
    );
  }
   Widget menuPage2() {
    return ListTile(
      leading: Icon(
        Icons.filter_2,
        size: 36.0,
        color: Colors.blue,
      ),
      title: Text('Read QR Code'),
      subtitle: Text('Detail Page 2'),
      onTap: (){
        setState(() {
          currentWidget = Page2();
        });
        Navigator.of(context).pop();
      },
    );
  }

  Widget menuPage1() {
    return ListTile(
      leading: Icon(
        Icons.filter_1,
        size: 36.0,
        color: Colors.blue,
      ),
      title: Text('Page 1'),
      subtitle: Text('Detail Page 1'),
      onTap: (){
        setState(() {
          currentWidget = Page1();
        });
        Navigator.of(context).pop();
      },
    );
  }

  Widget showLogin() {
    return Text('Login By ${myUserModel.name}');
  }

  Widget headDrawer() {
    return DrawerHeader(
      child: Column(
        children: <Widget>[
          showLogo(),
          showLogin(),
        ],
      ),
    );
  }

  Widget showLogo() {
    return Container(
      height: 80.0,
      child: Image.asset('images/logo.png'),
    );
  }

  Widget showDrawer() {
    return Drawer(
      child: ListView(
        children: <Widget>[headDrawer(),menuPage1(),menuPage2(),menuPage3()],
      ),
    );
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    myUserModel = widget.userModel;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //3 Scaffold

      appBar: AppBar(
        title: Text('Service'),
      ),
      body: currentWidget, drawer: showDrawer(),
    );
  }
}
