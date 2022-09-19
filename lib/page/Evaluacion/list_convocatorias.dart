import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_proyecto_1/db/db_admin.dart';
import 'package:flutter_proyecto_1/models/convocatoria.dart';
import 'package:path/path.dart';

import '../../ui/generales/colors.dart';
import '../convocatoria/lista_participantes.dart';
import 'list_participantes.dart';

class ListConvocatoriasActivas extends StatefulWidget {
  const ListConvocatoriasActivas({Key? key}) : super(key: key);

  @override
  State<ListConvocatoriasActivas> createState() =>
      _ListConvocatoriasActivasState();
}

class _ListConvocatoriasActivasState extends State<ListConvocatoriasActivas> {
  /* Procedimientos */
  cantidadParticipantes(int? id) {
    return "1";
  }

  String cantidadEvaluadores(int id) {
    print("el  id $id");
    DBAdmin.db.getCantidadEvaluadorConvocatoria(id).then((value) {
      print("El value $value");
      return value.toString();
    });
    return "1";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Convocatorias Programadas"),
        backgroundColor: dcolorAppBar,
      ),
      body: FutureBuilder(
          future: DBAdmin.db.getConvocatoriasActivasEvaluadores(1),
          builder: (BuildContext context, AsyncSnapshot snap) {
            if (snap.hasData) {
              List<ConvocatoriaModel> miModelConvo = snap.data;
              return ListView.builder(
                  itemCount: miModelConvo.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 3.0, horizontal: 12.0),
                      child: Container(
                        height: 70,
                        margin: const EdgeInsets.all(10.0),
                        decoration: const BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(14)),
                            gradient: LinearGradient(
                                begin: Alignment.centerLeft,
                                end: Alignment.centerRight,
                                tileMode: TileMode.clamp,
                                colors: [
                                  Color.fromARGB(255, 102, 128, 235),
                                  Color(0xff8E7AF0)
                                ]),
                            boxShadow: [
                              BoxShadow(
                                  blurRadius: 0.2,
                                  spreadRadius: 2,
                                  color: Colors.grey)
                            ]),
                        child: ListTile(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        ListParticipantesConvo()));
                          },
                          leading: CircleAvatar(
                              child: Text(
                            index.toString(),
                            textAlign: TextAlign.center,
                          )),
                          minVerticalPadding: 10,
                          title: Text(miModelConvo[index].Titulo.toString(),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                  fontSize: 18.0,
                                  color: Colors.amberAccent,
                                  fontWeight: FontWeight.bold)),
                          subtitle: Row(children: [
                            Column(
                              children: [
                                Text(
                                    cantidadParticipantes(
                                        miModelConvo[index].id),
                                    style: TextStyle(
                                        fontSize: 10.0, color: Colors.black)),
                                Text("Participantes",
                                    style: TextStyle(
                                        fontSize: 10.0, color: Colors.black)),
                              ],
                            ),
                            const SizedBox(width: 25),
                            Column(
                              children: [
                                Text(
                                    cantidadEvaluadores(miModelConvo[index].id!)
                                        .toString(),
                                    style: const TextStyle(
                                        fontSize: 10.0, color: Colors.black)),
                                const Text("Evaluadores",
                                    style: TextStyle(
                                        fontSize: 10.0, color: Colors.black))
                              ],
                            )
                          ]),
                        ),
                      ),
                    );
                  });
            }
            return const Center(
              child: CircularProgressIndicator(),
            );
          }),
    );
  }
}
