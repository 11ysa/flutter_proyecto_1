import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_proyecto_1/db/db_admin.dart';

class HomeParticipante extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Column(
        children: [
          ElevatedButton(
              onPressed: () {
                DBAdmin.db.getJurado();
              },
              child: Text("Mostrar jurado")),
          ElevatedButton(
              onPressed: () {
                DBAdmin.db.getParticipante();
              },
              child: Text("Mostrar particiapnte")),
          ElevatedButton(
              onPressed: () {
                DBAdmin.db.insertLicences1();
              },
              child: Text("insertar 1")),
          ElevatedButton(
              onPressed: () {
                DBAdmin.db.insertLicences3();
              },
              child: Text("insertar 2")),
          ElevatedButton(
              onPressed: () {
                DBAdmin.db.initDatabase2();
              },
              child: Text("INI"))
        ],
      )),
    );
  }
}
