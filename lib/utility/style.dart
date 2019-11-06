import 'package:flutter/material.dart';

class MyStyle {
  double h1 = 30.0, h2 = 18.0;
  String nameFont = 'Itim';


  Color txt900 = Colors.blue[900];
  Color txt600 = Colors.blue[600];
  Color btColor = Colors.orange;
  Color bdColor = Colors.orange;

  TextStyle btTxtStyle = TextStyle(color: Colors.white);
  TextStyle bdTxtStyle = TextStyle(color: Colors.orange);

  ShapeBorder btStyle = RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0));

  MyStyle();
}
