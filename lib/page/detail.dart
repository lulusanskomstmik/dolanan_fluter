import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:fluter_ku/modelproduk.dart';
import 'package:http/http.dart' as http;

class Detail extends StatefulWidget {
  final String code;
  Detail(this.code);
  
  @override
  _DetailState createState() => _DetailState();
}

class _DetailState extends State<Detail> {

  Produk produk;

  Future<Produk> getProduk() async{
    await http.get("https://mudik.kuduskab.go.id/asetPemda/tampil.php?kode_qr=${widget.code}")
    .then(
      (response) {
        if (jsonDecode(response.body)!=null) {
          setState(() {
            produk = Produk.fromJson(jsonDecode(response.body));
          });
        }
      });
      return produk;
  }


  @override
  void initState() {
    getProduk();
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: produk == null 
          ? Text('DATA KOSONG, ${widget.code}', style: TextStyle(fontSize: 20), ) 
        : Container(
          child: Column(
            children: <Widget>[
              Text("Kode: ${produk.kode}", style: TextStyle(fontSize: 20) ),
              
              Text("Nama Barang: ${produk.namaBarang}", style: TextStyle(fontSize: 20) ),
            ],
          ),
        ),
      ),
    );
  }
}