import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:storage_dersleri/sqflite_islemleri.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Flutter Demo",
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: SqfliteIslemleri(),
    );
  }
}
