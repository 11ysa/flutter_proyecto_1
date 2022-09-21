import 'package:flutter/material.dart';
import 'package:flutter_proyecto_1/models/convocatoria.dart';
import 'package:flutter_proyecto_1/page/Evaluacion/list_items.dart';
import 'package:flutter_proyecto_1/page/Organizador/Participante/widget.dart';
import 'package:flutter_svg/svg.dart';

import '../../db/db_admin.dart';
import '../../models/participante.dart';
import '../../ui/generales/colors.dart';

// ignore: must_be_immutable
class ListParticipantesConvo extends StatefulWidget {
  ConvocatoriaModel modelConvo;
  ListParticipantesConvo({Key? key, required this.modelConvo})
      : super(key: key);

  @override
  State<ListParticipantesConvo> createState() => _ListParticipantesConvoState();
}

class _ListParticipantesConvoState extends State<ListParticipantesConvo> {
  /* Variables */
  ParticipanteModel? modelParticipante;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: appBarParticipante,
        body: FutureBuilder(
            future: DBAdmin.db.getParticipante(),
            builder: (BuildContext context, AsyncSnapshot snap) {
              if (snap.hasData) {
                List<ParticipanteModel> listaPar = snap.data;
                return ListView.builder(
                    itemCount: listaPar.length,
                    itemBuilder: (BuildContext context, index) {
                      modelParticipante = listaPar[index];
                      return GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => ListItems(
                                        modelPart: modelParticipante!,
                                        modelConv: widget.modelConvo,
                                      )));
                        },
                        child: Container(
                          margin: const EdgeInsets.symmetric(
                              horizontal: 5.0, vertical: 5.0),
                          padding: const EdgeInsets.symmetric(
                              horizontal: 5, vertical: 5),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(14),
                              gradient: const LinearGradient(
                                  begin: Alignment.centerLeft,
                                  end: Alignment.centerRight,
                                  tileMode: TileMode.clamp,
                                  colors: [
                                    Color(0xff363f93),
                                    Color(0xff8E7AF0)
                                  ]),
                              boxShadow: const [
                                BoxShadow(
                                  blurRadius: 0.2,
                                  spreadRadius: 2,
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
                                      SvgPicture.asset('assets/icons/user.svg',
                                          height: 18.0,
                                          color: dColorFontPrimary),
                                      const SizedBox(
                                        width: 4.0,
                                      ),
                                      Column(
                                        children: [
                                          Text(
                                            listaPar[index].nombre,
                                            style: const TextStyle(
                                              fontSize: 18.0,
                                              color: Colors.amberAccent,
                                            ),
                                          ),
                                          Text(
                                            listaPar[index].apellidos,
                                            style: TextStyle(
                                              fontSize: 14.0,
                                              color: dColorFontPrimary,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                  const SizedBox(
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
                                                  color: dColorFontPrimary,
                                                ),
                                              ),
                                              Text(
                                                listaPar[index].dni,
                                                style: TextStyle(
                                                    fontSize: 13.0,
                                                    color: dColorFontPrimary),
                                              )
                                            ],
                                          ),
                                          const SizedBox(
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
                                                  color: dColorFontPrimary,
                                                ),
                                              ),
                                              Text(
                                                listaPar[index].edad.toString(),
                                                style: TextStyle(
                                                  fontSize: 14.0,
                                                  color: dColorFontPrimary,
                                                ),
                                              )
                                            ],
                                          ),
                                          const SizedBox(
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
                                                  color: dColorFontPrimary,
                                                ),
                                              ),
                                              Text(
                                                listaPar[index].especialidad,
                                                style: TextStyle(
                                                  fontSize: 14.0,
                                                  color: dColorFontPrimary,
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
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  IconButton(
                                      onPressed: () {
                                        modelParticipante = listaPar[index];
                                      },
                                      icon: const Icon(Icons.list_alt))
                                ],
                              )
                            ],
                          ),
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
