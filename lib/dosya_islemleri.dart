import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';

class DosyaIslemleri extends StatefulWidget {
  @override
  _DosyaIslemleriState createState() => _DosyaIslemleriState();
}

class _DosyaIslemleriState extends State<DosyaIslemleri> {
  var myTextController = TextEditingController();

  //oluşturualacak dosyanın klasör yolu
  Future<String> get getklasorYolu async {
    Directory klasor = await getApplicationDocumentsDirectory();
    debugPrint("klasorun pathi : " + klasor.path);
    return klasor.path;
  }

  //dosya oluştur
  Future<File> get dosyaOlustur async {
    var olusturulacakDosyaninKlasorununYolu = await getklasorYolu;
    return File(olusturulacakDosyaninKlasorununYolu + "/myDosya.txt");
  }

  //dosya okuma işlemlri
  Future<String> dosyaOku() async {
    try {
      var myDosya = await dosyaOlustur;
      String dosyaIcerigi = await myDosya.readAsString();
      return dosyaIcerigi;
    } catch (exception) {
      return "hata çıktı $exception";
    }
  }

  //dosya yazma işlemi
  Future<File> dosyayaYaz(String yazilacakString) async {
    var myDosya = await dosyaOlustur;
    return myDosya.writeAsString(yazilacakString);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Dosya İşlemleri")),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.all(8),
              child: TextField(
                controller: myTextController,
                maxLines: 4,
                decoration: InputDecoration(
                    hintText: "buraya yazılacak değerler dosyaya kaydedilir"),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                RaisedButton(
                    onPressed: _dosyaYaz,
                    color: Colors.green,
                    child: Text("dosyaya yaz ")),
                RaisedButton(
                    onPressed: _dosyaOku,
                    color: Colors.blue,
                    child: Text("dosyaya oku ")),
              ],
            ),
          ],
        ),
      ),
    );
  }

  void _dosyaYaz() {
    dosyayaYaz(myTextController.text.toString());
  }

  void _dosyaOku() async {
    //debugPrint(await dosyaOku());
    dosyaOku().then((icerik) => debugPrint(icerik));
  }
}
