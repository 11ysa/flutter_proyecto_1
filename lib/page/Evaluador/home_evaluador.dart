import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_proyecto_1/db/db_admin.dart';
import 'package:flutter_proyecto_1/models/evaluador.dart';

import 'package:flutter_proyecto_1/ui/generales/colors.dart';
import 'package:flutter_svg/svg.dart';

import 'form_Evaluador.dart';

class HomeEvaluador extends StatefulWidget {
  @override
  State<HomeEvaluador> createState() => _HomeEvaluadorState();
}

class _HomeEvaluadorState extends State<HomeEvaluador> {
  EvaluadorModel? EvalModel;
  Widget Jerarquia(String jerarquia) {
    Widget fila;
    switch (jerarquia) {
      case "Asistente":
        fila = Row(
          // ignore: prefer_const_literals_to_create_immutables
          children: [
            Icon(Icons.star, size: 14, color: Colors.amber[700]),
            Icon(Icons.star,
                size: 14, color: Color.fromARGB(255, 223, 220, 215)),
            Icon(Icons.star,
                size: 14, color: Color.fromARGB(255, 223, 220, 215)),
          ],
        );
        break;
      case "Colaborador":
        fila = Row(
          // ignore: prefer_const_literals_to_create_immutables
          children: [
            Icon(
              Icons.star,
              size: 14,
              color: Colors.amber[700],
            ),
            Icon(
              Icons.star,
              size: 14,
              color: Colors.amber[700],
            ),
            Icon(Icons.star,
                size: 14, color: Color.fromARGB(255, 223, 220, 215)),
          ],
        );
        break;

      default:
        fila = Row(
          // ignore: prefer_const_literals_to_create_immutables
          children: [
            Icon(Icons.star, size: 14, color: Colors.amber[700]),
            Icon(Icons.star, size: 14, color: Colors.amber[700]),
            Icon(Icons.star, size: 14, color: Colors.amber[700]),
          ],
        );
    }
    return fila;
  }

  deleteEvaluador(int id) {
    DBAdmin.db.deleteEvaluador(id).then((value) {
      if (value > 0) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Row(
          children: const [
            Icon(Icons.check_circle, color: Colors.white),
            SizedBox(width: 10),
            Text("Evaluador Eliminado")
          ],
        )));
      }
    });
  }

  showFormEvaluador() {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return FormEvaluador(eModel: EvalModel);
        }).then((value) {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Evaluador"),
          backgroundColor: dcolorAppBar,
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            EvalModel = null;
            showFormEvaluador();
          },
          child: const Icon(Icons.add),
        ),
        body: FutureBuilder(
            future: DBAdmin.db.getEvaluador(),
            builder: (BuildContext context, AsyncSnapshot snap) {
              if (snap.hasData) {
                List<EvaluadorModel> miEvalModel = snap.data;
                return ListView.builder(
                    itemCount: miEvalModel.length,
                    itemBuilder: (BuildContext context, index) {
                      return Dismissible(
                        key: UniqueKey(),
                        // confirmDismiss: (DismissDirection direction) async {},
                        direction: DismissDirection.startToEnd,
                        background: Container(color: Colors.redAccent),
                        //finalizar el arrastre
                        onDismissed: (DismissDirection direction) {
                          deleteEvaluador(miEvalModel[index].id!);
                        },
                        child: Container(
                          margin: const EdgeInsets.symmetric(
                              horizontal: 2.0, vertical: 2.0),
                          padding: const EdgeInsets.symmetric(
                              horizontal: 2, vertical: 2),
                          decoration: BoxDecoration(
                              color: dcolorFondoItems,
                              borderRadius: BorderRadius.circular(14),
                              boxShadow: [
                                BoxShadow(
                                    blurRadius: 12,
                                    offset: const Offset(4, 4),
                                    color: dcolorBordeItems)
                              ]),
                          child: ListTile(
                              leading: CircleAvatar(
                                child: Text("A"),
                              ),
                              title: Text(
                                miEvalModel[index].nombreCompleto(),
                                maxLines: 1,
                                style: TextStyle(
                                  fontSize: 15.0,
                                  color: dColorFontPrimary.withOpacity(0.7),
                                ),
                              ),
                              subtitle: Column(
                                children: [
                                  Row(
                                    children: [
                                      SvgPicture.asset(
                                          'assets/icons/id-card.svg',
                                          height: 15.0,
                                          color: dColorFontPrimary),
                                      const SizedBox(
                                        width: 2,
                                      ),
                                      Text(
                                        miEvalModel[index].dni,
                                        style: TextStyle(
                                          fontSize: 12.0,
                                          color: dColorFontPrimary
                                              .withOpacity(0.7),
                                        ),
                                      ),
                                      const SizedBox(
                                        width: 10,
                                      ),
                                      SvgPicture.asset(
                                          'assets/icons/user-badge.svg',
                                          height: 15.0,
                                          color: dColorFontPrimary),
                                      Text(
                                        miEvalModel[index].jerarquia,
                                        style: TextStyle(
                                          fontSize: 12.0,
                                          color: dColorFontPrimary
                                              .withOpacity(0.7),
                                        ),
                                      ),
                                    ],
                                  ),
                                  Jerarquia(miEvalModel[index].jerarquia)
                                ],
                              ),
                              trailing: IconButton(
                                  onPressed: () {
                                    EvalModel = miEvalModel[index];
                                    showFormEvaluador();
                                  },
                                  icon: Icon(Icons.edit))),
                        ),
                      );
                    });
              }

              return const Center(
                child: CircularProgressIndicator(),
              );
            }));
  }
}
