import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ListPorcentaje extends StatefulWidget {
  @override
  State<ListPorcentaje> createState() => _ListPorcentajeState();
}

class _ListPorcentajeState extends State<ListPorcentaje> {
  //variables

  //procedimientos

  @override
  Widget build(BuildContext context) {
    return Container(
      child: AlertDialog(
          content: Column(
        children: [
          ListView.builder(
              itemCount: 1,
              itemBuilder: (BuildContext context, index) {
                return ListTile(
                  title: Text("10"),
                );
              })
        ],
      )),
    );
  }
}
