import 'package:flutter/material.dart';
import 'package:flutter_proyecto_1/page/home_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Material App',
      home: Scaffold(
          backgroundColor: Colors.indigo, body: SafeArea(child: HomePage())),
    );
  }
}
