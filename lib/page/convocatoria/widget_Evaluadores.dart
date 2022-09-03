import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_proyecto_1/db/db_admin.dart';
import 'package:flutter_proyecto_1/models/evaluador.dart';
import 'package:flutter_proyecto_1/page/convocatoria/lista_evaluadores.dart';

import '../../ui/generales/colors.dart';

class CardEvaluadores extends StatefulWidget {
  int? idConvocatoria;
  CardEvaluadores({this.idConvocatoria});
  @override
  State<CardEvaluadores> createState() => _CardEvaluadoresState();
}

class _CardEvaluadoresState extends State<CardEvaluadores> {
  /* procedimientos */
  showEvaluadores() {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return (ListEvaluadores(
            idconvocatoria: widget.idConvocatoria,
          ));
        });
  }

  deleteEvaluadorConvocatoria(int id) {
    DBAdmin.db.deleteConvocatoriaEvaluador(id).then((value) {
      if (value > 0) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Row(
          children: const [
            Icon(Icons.check_circle, color: Colors.white),
            SizedBox(width: 10),
            Text("Evaluador Descartado")
          ],
        )));
      }
      setState(() {});
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print(widget.idConvocatoria);
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
            SizedBox(
              height: 5,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: const [
                Icon(
                  Icons.supervised_user_circle_outlined,
                  color: Colors.indigo,
                ),
                SizedBox(
                  width: 10,
                ),
                Text(
                  "Evaluadores",
                  style: TextStyle(
                      color: Colors.indigo, fontWeight: FontWeight.w500),
                ),
              ],
            ),
            Container(
              width: 300,
              height: 100,
              child: FutureBuilder(
                  future:
                      DBAdmin.db.getNombreEvaluadores(widget.idConvocatoria),
                  builder: (BuildContext context, AsyncSnapshot snap) {
                    if (snap.hasData) {
                      List<EvaluadorModel> modelEvalu = snap.data;
                      return ListView.builder(
                          itemCount: modelEvalu.length,
                          itemBuilder: (BuildContext context, index) {
                            return Dismissible(
                              key: UniqueKey(),
                              direction: DismissDirection.startToEnd,
                              background: Container(color: Colors.amber),
                              onDismissed: (DismissDirection direction) {
                                deleteEvaluadorConvocatoria(
                                    modelEvalu[index].id!);
                              },
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Divider(
                                    thickness: 1,
                                  ),
                                  Text(modelEvalu[index].nombreCompleto()),
                                  Row(
                                    children: [
                                      // ignore: prefer_const_constructors
                                      Text(
                                        modelEvalu[index].dni,
                                        style: TextStyle(fontSize: 12),
                                      ),
                                      SizedBox(
                                        width: 30,
                                      ),
                                      JeraquiaStar,
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
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  width: 30,
                  padding: EdgeInsets.all(2),
                  child: ElevatedButton(
                    onPressed: () {
                      showEvaluadores();
                    },
                    child: Icon(
                      Icons.add,
                      size: 15,
                    ),
                    style: ElevatedButton.styleFrom(
                        shape: CircleBorder(), padding: EdgeInsets.all(5)),
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
