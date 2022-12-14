import 'package:flutter/material.dart';
import 'package:flutter_proyecto_1/db/db_admin.dart';
import 'package:flutter_proyecto_1/models/conevaluador.dart';
import 'package:flutter_proyecto_1/models/convocatoria.dart';
import 'package:flutter_proyecto_1/models/evaluador.dart';
import 'package:flutter_proyecto_1/page/Organizador/Convocatoria/form_Convocatoria.dart';
import 'package:flutter_proyecto_1/ui/generales/colors.dart';
import 'package:flutter_svg/svg.dart';

class ListEvaluadores extends StatefulWidget {
  ConvocatoriaModel? model;
  ListEvaluadores({this.model});

  @override
  State<ListEvaluadores> createState() => _ListEvaluadoresState();
}

class _ListEvaluadoresState extends State<ListEvaluadores> {
  //variables
  int? idConvo;
  //procedimientos
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

  InsertarEvaluConvoca(int ideval) {
    ConEvaluadorModel model =
        ConEvaluadorModel(idevaluador: ideval, idconvocatoria: idConvo!);
    DBAdmin.db.insertamosConvocatoriaEvaluador(model).then((value) {
      if (value > 0) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Row(
          children: const [
            Icon(
              Icons.check_circle,
              color: Colors.white,
            ),
            SizedBox(width: 10),
            Text("Evaluador Agregado")
          ],
        )));
      }
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    idConvo = widget.model!.id;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: AlertDialog(
          title: const Text("Designar Evaluadores"),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              FutureBuilder(
                  future: DBAdmin.db.getEvaluador(),
                  builder: (BuildContext context, AsyncSnapshot snap) {
                    if (snap.hasData) {
                      List<EvaluadorModel> miEvalModel = snap.data;
                      return Container(
                        height: 450,
                        width: 400,
                        child: ListView.builder(
                            itemCount: miEvalModel.length,
                            itemBuilder: (BuildContext context, index) {
                              return Dismissible(
                                key: UniqueKey(),
                                // confirmDismiss: (DismissDirection direction) async {},
                                direction: DismissDirection.startToEnd,
                                background: Container(color: Colors.amber),
                                //finalizar el arrastre
                                onDismissed: (DismissDirection direction) {
                                  InsertarEvaluConvoca(miEvalModel[index].id!);
                                },

                                child: ListTile(
                                    title: Text(
                                      miEvalModel[index].nombreCompleto(),
                                      maxLines: 1,
                                      style: TextStyle(
                                        fontSize: 15.0,
                                        color:
                                            dColorFontPrimary.withOpacity(0.7),
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
                                        onPressed: () {},
                                        icon: Icon(Icons.check_box))),
                              );
                            }),
                      );
                    }

                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }),
              SizedBox(
                width: double.infinity,
                height: 54,
                child: ElevatedButton.icon(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (BuildContext context) =>
                                  FormConvocatoria(
                                    modelConvo: widget.model,
                                  )));
                    },
                    style: ElevatedButton.styleFrom(
                        primary: dcolorAppBar,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(14))),
                    icon: const Icon(Icons.backspace_outlined),
                    label: const Text("Volver")),
              )
            ],
          )),
    );
  }
}
