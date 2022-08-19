import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeJurado extends StatelessWidget {
  const HomeJurado({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Column(
        children: [
          ElevatedButton(onPressed: () {}, child: Text("Mostrar jurado")),
          ElevatedButton(onPressed: () {}, child: Text("Mostrar particiapnte")),
          ElevatedButton(onPressed: () {}, child: Text("insertar 1")),
          ElevatedButton(onPressed: () {}, child: Text("insertar 2")),
          ElevatedButton(onPressed: () {}, child: Text("INI"))
        ],
      )),
    );
  }
}
