import 'package:flutter_dbms/pages/home.dart';
import 'package:flutter/material.dart';
import './pages/login.dart';


void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    theme: ThemeData(
      primaryColor: Colors.red.shade900
    ),
    home: Login(),
  ));
}
