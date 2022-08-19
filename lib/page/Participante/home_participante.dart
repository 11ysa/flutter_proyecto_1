import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_proyecto_1/db/db_admin.dart';
import 'package:flutter_proyecto_1/page/Participante/nuevo_participante.dart';
import 'package:flutter_proyecto_1/page/Participante/widget.dart';
import 'package:flutter_proyecto_1/ui/generales/colors.dart';

import 'items_list.dart';

class HomeParticipante extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarParticipante,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => NuevoParticipante()));
        },
        child: const Icon(Icons.add),
      ),
      body: Padding(
        padding: const EdgeInsets.all(14),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text(
            "Lista de Participantes",
            style: TextStyle(
                color: dcolorTitulo, fontWeight: FontWeight.w600, fontSize: 18),
          ),
          const SizedBox(
            height: 10.0,
          ),
          Expanded(
            child: ListView.builder(
                physics: const BouncingScrollPhysics(),
                itemCount: 100,
                itemBuilder: (BuildContext context, index) {
                  return ItemsParticipante();
                }),
          )
        ]),
      ),
    );
  }
}
