import 'package:flutter/material.dart';
import 'package:flutter_proyecto_1/page/home_page.dart';
import 'package:flutter_proyecto_1/ui/generales/colors.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Material App',
      home: Scaffold(
          backgroundColor: dcolorFondo, body: SafeArea(child: HomePage())),
    );
  }
}
