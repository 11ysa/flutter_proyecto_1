import 'package:flutter/material.dart';
import 'package:flutter_proyecto_1/db/db_admin.dart';
import 'package:flutter_proyecto_1/models/participante.dart';
import 'package:flutter_proyecto_1/page/Organizador/Participante/widget.dart';
import 'package:flutter_proyecto_1/ui/generales/colors.dart';
import 'package:flutter_svg/svg.dart';
import 'form_participante.dart';

class HomePaticipante extends StatefulWidget {
  HomePaticipante({Key? key}) : super(key: key);

  @override
  State<HomePaticipante> createState() => _HomePaticipanteState();
}

class _HomePaticipanteState extends State<HomePaticipante> {
  /* Variables */
  ParticipanteModel? modelParticipante;

  /* Procedimientos */

  //eliminar participante

  deleteParticipante(int id) {
    DBAdmin.db.deleteParticipante(id).then((value) {
      if (value > 0) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
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

//Mostrar Formulario
  showParticipante() {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return FormParticipante(modelPartici: modelParticipante);
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
            modelParticipante = null;
            showParticipante();
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
                            deleteParticipante(listaPar[index].id!);
                          },
                          child: Container(
                            margin: const EdgeInsets.symmetric(
                                horizontal: 5.0, vertical: 5.0),
                            padding: const EdgeInsets.symmetric(
                                horizontal: 5, vertical: 5),
                            decoration: BoxDecoration(
                                color: dcolorFondoItems,
                                borderRadius: BorderRadius.circular(14),
                                boxShadow: [
                                  BoxShadow(
                                    color: dcolorBordeItems,
                                    blurRadius: 12,
                                    offset: const Offset(4, 4),
                                  )
                                ]),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      children: [
                                        SvgPicture.asset(
                                            'assets/icons/user.svg',
                                            height: 16.0,
                                            color: dColorFontPrimary),
                                        const SizedBox(
                                          width: 4.0,
                                        ),
                                        Text(
                                          listaPar[index].nombreCompleto(),
                                          style: TextStyle(
                                            fontSize: 14.0,
                                            color: dColorFontPrimary
                                                .withOpacity(0.7),
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      height: 10.0,
                                    ),
                                    Row(
                                      children: [
                                        SvgPicture.asset(
                                            'assets/icons/id-card.svg',
                                            height: 16.0,
                                            color: dColorFontPrimary),
                                        const SizedBox(
                                          width: 4.0,
                                        ),
                                        Row(
                                          children: [
                                            Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  "DNI:",
                                                  style: TextStyle(
                                                    fontWeight: FontWeight.w600,
                                                    fontSize: 12.0,
                                                    color: dColorFontPrimary
                                                        .withOpacity(0.7),
                                                  ),
                                                ),
                                                Text(
                                                  listaPar[index].dni,
                                                  style: TextStyle(
                                                    fontSize: 13.0,
                                                    color: dColorFontPrimary
                                                        .withOpacity(0.7),
                                                  ),
                                                )
                                              ],
                                            ),
                                            SizedBox(
                                              width: 20,
                                            ),
                                            Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  "Edad:",
                                                  style: TextStyle(
                                                    fontWeight: FontWeight.w600,
                                                    fontSize: 14.0,
                                                    color: dColorFontPrimary
                                                        .withOpacity(0.7),
                                                  ),
                                                ),
                                                Text(
                                                  listaPar[index]
                                                      .edad
                                                      .toString(),
                                                  style: TextStyle(
                                                    fontSize: 14.0,
                                                    color: dColorFontPrimary
                                                        .withOpacity(0.7),
                                                  ),
                                                )
                                              ],
                                            ),
                                            SizedBox(
                                              width: 20,
                                            ),
                                            Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  "Especialidad:",
                                                  style: TextStyle(
                                                    fontWeight: FontWeight.w600,
                                                    fontSize: 14.0,
                                                    color: dColorFontPrimary
                                                        .withOpacity(0.7),
                                                  ),
                                                ),
                                                Text(
                                                  listaPar[index].especialidad,
                                                  style: TextStyle(
                                                    fontSize: 14.0,
                                                    color: dColorFontPrimary
                                                        .withOpacity(0.7),
                                                  ),
                                                )
                                              ],
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                                Container(
                                    child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    IconButton(
                                        onPressed: () {
                                          modelParticipante = listaPar[index];
                                          showParticipante();
                                        },
                                        icon: Icon(Icons.edit))
                                  ],
                                ))
                              ],
                            ),
                          ));
                    });
              }

              return const Center(
                child: CircularProgressIndicator(),
              );
            }));
  }
}
