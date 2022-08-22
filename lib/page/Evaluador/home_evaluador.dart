import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_proyecto_1/db/db_admin.dart';
import 'package:flutter_proyecto_1/models/Evaluador.dart';
import 'package:flutter_proyecto_1/page/Evaluador/nuevo_Evaluador.dart';
import 'package:flutter_proyecto_1/ui/generales/colors.dart';

class HomeEvaluador extends StatefulWidget {
  const HomeEvaluador({Key? key}) : super(key: key);

  @override
  State<HomeEvaluador> createState() => _HomeEvaluadorState();
}

class _HomeEvaluadorState extends State<HomeEvaluador> {
  showNuevoEvaluador(contex) {
    showDialog(
        context: contex,
        builder: (BuildContext context) {
          return formNuevoEvaluador();
        }).then((value) {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Evaluador"),
        backgroundColor: dcolorAppBar,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showNuevoEvaluador(context);
        },
        child: const Icon(Icons.add),
      ),
      /* body: FutureBuilder(
            future: DBAdmin.db.getParticipante(),
            builder: (BuildContext context, AsyncSnapshot snap) {
              if (snap.hasData) {
                List<EvaluadorModel> evaluModel = snap.data;
                return ListView.builder(
                    itemCount: evaluModel.length,
                    itemBuilder: (BuildContext context, index) {
                      return Dismissible(
                        key: UniqueKey(),
                        // confirmDismiss: (DismissDirection direction) async {},
                        direction: DismissDirection.startToEnd,
                        background: Container(color: Colors.redAccent),
                        //finalizar el arrastre
                        onDismissed: (DismissDirection direction) {
                       //   deleteParticipante(context, listaPar[index].id!);
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
            }
            )*/
    );
  }
}
