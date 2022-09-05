import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_proyecto_1/models/conparticipante.dart';
import 'package:flutter_proyecto_1/models/convocatoria.dart';
import 'package:flutter_proyecto_1/models/participante.dart';
import 'package:flutter_svg/svg.dart';

import '../../db/db_admin.dart';
import '../../ui/generales/colors.dart';
import 'form_Convocatoria.dart';

class ListParticipantes extends StatefulWidget {
  ConvocatoriaModel? model;
  ListParticipantes({this.model});

  @override
  State<ListParticipantes> createState() => _ListParticipantesState();
}

class _ListParticipantesState extends State<ListParticipantes> {
  //variables
  int? idConvo;
  //procedimientos

  InsertarPartiConvoca(int idPart) {
    ConParticipanteModel model =
        ConParticipanteModel(idparticipante: idPart, idconvocatoria: idConvo);

    DBAdmin.db.insertamosConvocatoriaParticipante(model).then((value) {
      if (value > 0) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Row(
          children: const [
            Icon(
              Icons.check_circle,
              color: Colors.white,
            ),
            SizedBox(width: 10),
            Text("Participante Agregado")
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
          title: const Text("Designar Participantes"),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              FutureBuilder(
                  future: DBAdmin.db.getParticipante(),
                  builder: (BuildContext context, AsyncSnapshot snap) {
                    if (snap.hasData) {
                      List<ParticipanteModel> miPartModel = snap.data;
                      return Container(
                        height: 450,
                        width: 400,
                        child: ListView.builder(
                            itemCount: miPartModel.length,
                            itemBuilder: (BuildContext context, index) {
                              return Dismissible(
                                key: UniqueKey(),
                                // confirmDismiss: (DismissDirection direction) async {},
                                direction: DismissDirection.startToEnd,
                                background: Container(color: Colors.amber),
                                //finalizar el arrastre
                                onDismissed: (DismissDirection direction) {
                                  InsertarPartiConvoca(miPartModel[index].id!);
                                },

                                child: ListTile(
                                    title: Text(
                                      miPartModel[index].nombreCompleto(),
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
                                              miPartModel[index].dni,
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
                                              miPartModel[index].especialidad,
                                              style: TextStyle(
                                                fontSize: 12.0,
                                                color: dColorFontPrimary
                                                    .withOpacity(0.7),
                                              ),
                                            ),
                                          ],
                                        ),
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
