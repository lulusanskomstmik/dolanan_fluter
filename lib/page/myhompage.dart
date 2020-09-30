import 'package:flutter/material.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:fluter_ku/page/detail.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  // String code="";
  // String getcode="";

  Future scanbarcode() async {
    await FlutterBarcodeScanner.scanBarcode("#009922", "CANCEL", true)
    .then((String kode) {
      Navigator.push(context, MaterialPageRoute(builder: (context) => Detail(kode)));
    });
    
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.yellow,
      appBar: AppBar(title: Text("SI-CANTIK"),),
      body: Center(
        child: Column(
          children: [
            FlatButton(
              child: Text("SCANN BARCODE", style: TextStyle(fontSize: 20, color:Colors.white),),
              color: Colors.blue,
              onPressed: (){scanbarcode();},
            ),
            
          ],
        )
      ),
    );
  }
}