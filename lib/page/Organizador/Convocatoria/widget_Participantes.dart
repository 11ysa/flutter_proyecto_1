import 'package:flutter/material.dart';
import 'package:flutter_proyecto_1/db/db_admin.dart';
import 'package:flutter_proyecto_1/models/convocatoria.dart';
import 'package:flutter_proyecto_1/models/participante.dart';
import 'package:flutter_proyecto_1/page/Organizador/Convocatoria/lista_participantes.dart';

class CardParticipantes extends StatefulWidget {
  ConvocatoriaModel? model;

  CardParticipantes({this.model});

  @override
  State<CardParticipantes> createState() => _CardParticipantesState();
}

class _CardParticipantesState extends State<CardParticipantes> {
  //variables
  int? idconvocatoria;
  /* procedimientos */
  showParticipantes() {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return (ListParticipantes(
            model: widget.model,
          ));
        });
  }

  deleteParticipanteConvocatoria(int idConvocatoria, int idparticipante) {
    DBAdmin.db
        .deleteConvocatoriaParticipante(idConvocatoria, idparticipante)
        .then((value) {
      if (value > 0) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Row(
          children: const [
            Icon(Icons.check_circle, color: Colors.white),
            SizedBox(width: 10),
            Text("Participante Descartado")
          ],
        )));
      }
      setState(() {});
    });
  }

  @override
  void initState() {
    super.initState();
    idconvocatoria = widget.model!.id;
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white54,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
      elevation: 5.0,
      child: Padding(
        padding: const EdgeInsets.all(2),
        child: Column(
          children: [
            const SizedBox(
              height: 5,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: const [
                Icon(
                  Icons.person,
                  color: Colors.indigo,
                ),
                SizedBox(
                  width: 10,
                ),
                Text(
                  "Participantes",
                  style: TextStyle(
                      color: Colors.indigo, fontWeight: FontWeight.w500),
                ),
              ],
            ),
            SizedBox(
              width: 300,
              height: 100,
              child: FutureBuilder(
                  future:
                      DBAdmin.db.getNombreParticipantesConvo(widget.model!.id),
                  builder: (BuildContext context, AsyncSnapshot snap) {
                    if (snap.hasData) {
                      List<ParticipanteModel> modelListPartic = snap.data;
                      return ListView.builder(
                          itemCount: modelListPartic.length,
                          itemBuilder: (BuildContext context, index) {
                            return Dismissible(
                              key: UniqueKey(),
                              direction: DismissDirection.startToEnd,
                              background: Container(color: Colors.amber),
                              onDismissed: (DismissDirection direction) {
                                deleteParticipanteConvocatoria(idconvocatoria!,
                                    modelListPartic[index].id!);
                              },
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Divider(
                                    thickness: 1,
                                  ),
                                  Text(modelListPartic[index].nombreCompleto()),
                                  Row(
                                    children: [
                                      // ignore: prefer_const_constructors
                                      Text(
                                        modelListPartic[index].dni,
                                        style: TextStyle(fontSize: 12),
                                      ),
                                      const SizedBox(
                                        width: 30,
                                      ),
                                      Text(
                                        modelListPartic[index].especialidad,
                                        style: TextStyle(fontSize: 12),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            );
                          });
                    }
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }),
            ),

            //botones

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(""),
                const Icon(Icons.arrow_downward),
                Container(
                  width: 30,
                  padding: EdgeInsets.all(2),
                  child: ElevatedButton(
                    onPressed: () {
                      showParticipantes();
                    },
                    // ignore: sort_child_properties_last
                    child: const Icon(
                      Icons.add,
                      size: 15,
                    ),
                    style: ElevatedButton.styleFrom(
                        shape: const CircleBorder(),
                        padding: const EdgeInsets.all(5)),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
