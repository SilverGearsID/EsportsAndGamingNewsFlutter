import 'package:alifappberita/home.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'K3519072 - Rizky Alif Septian Tegar',
      theme: ThemeData(
          appBarTheme: const AppBarTheme(
              foregroundColor: Colors.white,
              backgroundColor: Colors.deepPurple),
          brightness: Brightness.dark),
      home: Home(),
    );
  }
}
