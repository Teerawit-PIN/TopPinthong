import 'package:barcode_scan/barcode_scan.dart';
import 'package:flutter/material.dart';
import 'package:toppinthong/utility/style.dart';

class Page2 extends StatefulWidget {
  @override
  _Page2State createState() => _Page2State();
}

class _Page2State extends State<Page2> {
  //field
  String codeString = '';

  //Method
  Widget readQRbutton() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: <Widget>[
        Row(
          children: <Widget>[
            Expanded(
                          child: RaisedButton.icon(
                icon: Icon(Icons.photo_camera),
                label: Text('Read QR or Barcode'),
                onPressed: () {
                  readQRthread();
                },
              ),
            ),
          ],
        ),
      ],
    );
  }

  Future<void> readQRthread()async{
    try {
      String readedQR = await BarcodeScanner.scan();

      if (readedQR != null) {
        setState(() {
          codeString = readedQR;
        });
      }

    } catch (e) {
    }
  }

  Widget codeReaded() {
    var barcode = '$codeString';
    List<String> tests = barcode.split(" ");
    int index = 0;
    for (var test in tests) {
      print('tests[$index]=$test');
      index+=1;
    }
    return Center(
      child: Text(
        'Code Readed $codeString',
        style: TextStyle(
          color: MyStyle().txt600,
          fontSize: 14.0,
        ),
      ),
    );
  }

  Widget headTitle() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text('Read QRcode Or Barcode',
            style: TextStyle(
              fontSize: 18.0,
            )),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Stack(
        children: <Widget>[
          headTitle(),
          codeReaded(),
          readQRbutton(),
        ],
      ),
    );
  }
}
