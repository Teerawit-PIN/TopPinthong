import 'package:flutter/material.dart';
import 'package:toppinthong/utility/style.dart';

Widget showTitle(String title) {
  return ListTile(
    leading: Icon(
      Icons.add_alert,
      color: MyStyle().txt900,
      size: 30.0,
    ),
    title: Text(
      title,
      style: TextStyle(color: MyStyle().txt600),
    ),
  );
}

Widget okButton(BuildContext context) {
  return FlatButton(
    child: Text('OK'),
    onPressed: () {
      Navigator.of(context).pop();
    },
  );
}

Future<void> nomalDaialog(
    BuildContext context, String title, String message) async {
  showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: showTitle(title),
          content: Text(message),
          actions: <Widget>[okButton(context)],
        );
      });
}
