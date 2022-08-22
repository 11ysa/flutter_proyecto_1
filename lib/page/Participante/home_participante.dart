import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_proyecto_1/db/db_admin.dart';
import 'package:flutter_proyecto_1/models/participante.dart';
import 'package:flutter_proyecto_1/page/Participante/nuevo_participante.dart';
import 'package:flutter_proyecto_1/page/Participante/widget.dart';
import 'package:flutter_proyecto_1/ui/generales/colors.dart';
import 'package:path/path.dart';

import 'items_list.dart';

class HomeParticipante extends StatefulWidget {
  @override
  State<HomeParticipante> createState() => _HomeParticipanteState();
}

class _HomeParticipanteState extends State<HomeParticipante> {
  deleteParticipante(Context, int id) {
    DBAdmin.db.deleteParticipante(id).then((value) {
      if (value > 0) {
        ScaffoldMessenger.of(Context).showSnackBar(SnackBar(
            content: Row(
          children: const [
            Icon(Icons.check_circle, color: Colors.white),
            SizedBox(width: 10),
            Text("Participante Eliminado")
          ],
        )));
      }
    });
  }

  showNuevoParticipante(contex) {
    showDialog(
        context: contex,
        builder: (BuildContext context) {
          return formNuevoParticipante();
        }).then((value) {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: appBarParticipante,
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            showNuevoParticipante(context);
          },
          child: const Icon(Icons.add),
        ),
        body: FutureBuilder(
            future: DBAdmin.db.getParticipante(),
            builder: (BuildContext context, AsyncSnapshot snap) {
              if (snap.hasData) {
                List<ParticipanteModel> listaPar = snap.data;
                return ListView.builder(
                    itemCount: listaPar.length,
                    itemBuilder: (BuildContext context, index) {
                      return Dismissible(
                        key: UniqueKey(),
                        // confirmDismiss: (DismissDirection direction) async {},
                        direction: DismissDirection.startToEnd,
                        background: Container(color: Colors.redAccent),
                        //finalizar el arrastre
                        onDismissed: (DismissDirection direction) {
                          deleteParticipante(context, listaPar[index].id!);
                        },
                        child: ItemsParticipante(
                            id: int.parse(listaPar[index].id.toString()),
                            // ignore: prefer_interpolation_to_compose_strings
                            nombreCompleto: listaPar[index].nombre +
                                " " +
                                listaPar[index].apellidos,
                            dni: listaPar[index].dni,
                            edad: listaPar[index].edad.toString(),
                            especialidad: listaPar[index].especialidad),
                      );
                    });
              }

              return const Center(
                child: CircularProgressIndicator(),
              );
            }));
  }
}
