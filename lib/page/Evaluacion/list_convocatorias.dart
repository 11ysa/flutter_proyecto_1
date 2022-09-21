import 'package:flutter/material.dart';
import 'package:flutter_proyecto_1/db/db_admin.dart';
import 'package:flutter_proyecto_1/models/convocatoria.dart';
import 'package:flutter_proyecto_1/models/evaluador.dart';
import 'package:flutter_proyecto_1/ui/generales/colors.dart';
import 'list_participantes.dart';

class ListConvocatoriasActivas extends StatefulWidget {
  EvaluadorModel model;
  ListConvocatoriasActivas({Key? key, required this.model}) : super(key: key);

  @override
  State<ListConvocatoriasActivas> createState() =>
      _ListConvocatoriasActivasState();
}

class _ListConvocatoriasActivasState extends State<ListConvocatoriasActivas> {
  /* variables */
  ConvocatoriaModel? modelConv;
  /* Procedimientos */

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Convocatorias Programadas"),
        backgroundColor: dcolorAppBar,
      ),
      body: FutureBuilder(
          future:
              DBAdmin.db.getConvocatoriasActivasEvaluadores(widget.model.id!),
          builder: (BuildContext context, AsyncSnapshot snap) {
            if (snap.hasData) {
              List<ConvocatoriaModel> miModelConvo = snap.data;

              return ListView.builder(
                  itemCount: miModelConvo.length,
                  itemBuilder: (BuildContext context, int index) {
                    modelConv = miModelConvo[index];
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
                                colors: [Color(0xff363f93), Color(0xff8E7AF0)]),
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
                                        ListParticipantesConvo(
                                            modelConvo: modelConv!)));
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
                              style: const TextStyle(
                                  fontSize: 18.0,
                                  color: Colors.amberAccent,
                                  fontWeight: FontWeight.bold)),
                          subtitle: Row(children: [
                            Column(
                              children: [
                                FutureBuilder(
                                  future: DBAdmin.db
                                      .getCantidadParticipanteConvocatoria(
                                          miModelConvo[index].id),
                                  builder: ((context, snapshot) {
                                    if (snapshot.hasData) {
                                      return Text(snapshot.data.toString(),
                                          style: const TextStyle(
                                              fontSize: 10.0,
                                              color: Colors.black));
                                    } else {
                                      return const Text("0",
                                          style: TextStyle(
                                              fontSize: 10.0,
                                              color: Colors.black));
                                    }
                                  }),
                                ),
                                const Text("Participantes",
                                    style: TextStyle(
                                        fontSize: 10.0, color: Colors.black)),
                              ],
                            ),
                            const SizedBox(width: 25),
                            Column(
                              children: [
                                FutureBuilder(
                                  future: DBAdmin.db
                                      .getCantidadEvaluadorConvocatoria(
                                          miModelConvo[index].id!),
                                  builder: ((context, snapshot) {
                                    if (snapshot.hasData) {
                                      return Text(snapshot.data.toString(),
                                          style: const TextStyle(
                                              fontSize: 10.0,
                                              color: Colors.black));
                                    } else {
                                      return const Text("0",
                                          style: TextStyle(
                                              fontSize: 10.0,
                                              color: Colors.black));
                                    }
                                  }),
                                ),
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
