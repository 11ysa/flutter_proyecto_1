import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_proyecto_1/db/db_admin.dart';
import 'package:flutter_proyecto_1/models/convocatoria.dart';
import 'package:flutter_proyecto_1/models/participante.dart';

class ListItems extends StatefulWidget {
  ParticipanteModel modelPart;
  ConvocatoriaModel modelConv;

  ListItems({Key? key, required this.modelPart, required this.modelConv})
      : super(key: key);

  @override
  State<ListItems> createState() => _ListItemsState();
}

class _ListItemsState extends State<ListItems> {
  getItems() {
    DBAdmin.db.getItems(1).then(
      (value) {
        print(value[0].des5);
      },
    );
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getItems();
  }

  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;
    final double width = MediaQuery.of(context).size.width;
    int gender = 1;
    return Scaffold(
        backgroundColor: Colors.white,
        body: Column(
          children: [
            Container(
              height: 180,
              decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                    bottomRight: Radius.circular(50),
                  ),
                  color: Color(0xff363f93)),
              child: Stack(
                children: [
                  Positioned(
                      top: 80,
                      left: 0,
                      child: Container(
                        height: 80,
                        width: 300,
                        decoration: const BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.only(
                                topRight: Radius.circular(50),
                                bottomRight: Radius.circular(50))),
                      )),
                  Positioned(
                      top: 95,
                      left: 20,
                      child: Container(
                        height: 80,
                        width: 290,
                        child: Text(
                          widget.modelConv.Titulo.toString(),
                          style: const TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 18,
                              color: Color(0xff363f93)),
                          overflow: TextOverflow.ellipsis,
                          maxLines: 3,
                        ),
                      )),
                ],
              ),
            ),
            SizedBox(
              height: height * 0.02,
            ),
            Container(
              height: 160,
              child: Stack(
                children: [
                  Positioned(
                      top: 1,
                      left: 10,
                      right: 10,
                      child: Material(
                        child: Container(
                          height: 160,
                          width: width * 0.9,
                          decoration:
                              BoxDecoration(color: Colors.white, boxShadow: [
                            BoxShadow(
                                color: Colors.grey.withOpacity(0.3),
                                offset: Offset(-10.8, 10.0),
                                blurRadius: 20,
                                spreadRadius: 4.0)
                          ]),
                        ),
                      )),
                  Positioned(
                      top: 1,
                      left: 15,
                      child: Card(
                        elevation: 10.0,
                        shadowColor: Colors.grey.withOpacity(0.5),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15.0),
                        ),
                        child: Container(
                          height: 150,
                          width: 120,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10.0),
                              image: const DecorationImage(
                                  fit: BoxFit.fill,
                                  image: AssetImage(
                                      "assets/images/Masculino.png"))),
                        ),
                      )),
                  Positioned(
                      top: 20,
                      left: 150,
                      right: 10,
                      child: Center(
                        child: Column(
                          children: [
                            Text(
                              widget.modelPart.nombre,
                              style: const TextStyle(
                                  color: Color(0XFF363F93),
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                            Text(
                              widget.modelPart.apellidos,
                              style: const TextStyle(fontSize: 15),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                            const Divider(
                              color: Colors.black,
                            ),
                            Text(
                              widget.modelPart.especialidad,
                              textAlign: TextAlign.center,
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Text("Doc: "),
                                Text(widget.modelPart.dni),
                              ],
                            ),
                          ],
                        ),
                      ))
                ],
              ),
            ),
            Expanded(
                child: ListView(
              children: [
                Container(
                  height: 240,
                  padding: const EdgeInsets.only(left: 8, right: 8),
                  margin: const EdgeInsets.only(left: 8, right: 8, bottom: 8),
                  child: Container(
                    decoration: BoxDecoration(
                        color: const Color(0xff363f93),
                        borderRadius: const BorderRadius.only(
                            bottomLeft: Radius.circular(50.0),
                            topRight: Radius.circular(50.0)),
                        boxShadow: [
                          BoxShadow(
                              color: const Color(0xFF363f93).withOpacity(0.3),
                              offset: const Offset(-10.0, 0.0),
                              blurRadius: 20.0,
                              spreadRadius: 4.0)
                        ]),
                    child: Container(
                      padding: const EdgeInsets.only(left: 8, right: 8),
                      margin: const EdgeInsets.only(
                          left: 8, right: 10, bottom: 8, top: 8),
                      child: Column(
                        children: [
                          Expanded(
                            child: Text(
                              "EXPERIENCIA LABORAL EN CARGOS DE GERENTE O JEFE DE RECURSOS HUMANOS",
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(color: Colors.amber),
                            ),
                          ),
                          Divider(color: Colors.black),
                          Column(
                            children: [
                              Row(
                                children: [
                                  vineta(),
                                  Container(
                                    width: 240,
                                    child: Expanded(
                                      child: Text(
                                        "TITULADO, DOBLE ESPECIALIDAD/ DIPLOMADFSDFSDFSDFSDFSDFGHFDGHDFGHDFGJDF",
                                        maxLines: 2,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    ),
                                  ),
                                  Container(
                                    height: 16,
                                    child: Row(
                                      children: [
                                        Radio(
                                            value: 1,
                                            groupValue: gender,
                                            onChanged: (int? value) {
                                              gender = value!;
                                              setState(() {});
                                            }),
                                      ],
                                    ),
                                  ),
                                  Text(
                                    "5",
                                    style: TextStyle(fontSize: 15),
                                  )
                                ],
                              ),
                              Divider(
                                color: Colors.black.withOpacity(0.5),
                                indent: 15.0,
                                endIndent: 15.0,
                              ),
                              Row(
                                children: [
                                  vineta(),
                                  Container(
                                    width: 240,
                                    child: Expanded(
                                      child: Text(
                                        "TITULADO, DOBLE ESPECIALIDAD/ DIPLOMA",
                                        maxLines: 2,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    ),
                                  ),
                                  Container(
                                    height: 16,
                                    child: Row(
                                      children: [
                                        Radio(
                                            value: 1,
                                            groupValue: gender,
                                            onChanged: (int? value) {
                                              gender = value!;
                                              setState(() {});
                                            }),
                                      ],
                                    ),
                                  ),
                                  Text(
                                    "4",
                                    style: TextStyle(fontSize: 15),
                                  )
                                ],
                              ),
                              Divider(
                                color: Colors.black.withOpacity(0.5),
                                indent: 15.0,
                                endIndent: 15.0,
                              ),
                              Row(
                                children: [
                                  vineta(),
                                  Container(
                                    width: 240,
                                    child: Expanded(
                                      child: Text(
                                        "TITULADO, DOBLE ESPECIALIDAD/ DIPLOMA",
                                        maxLines: 2,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    ),
                                  ),
                                  Container(
                                    height: 16,
                                    child: Row(
                                      children: [
                                        Radio(
                                            value: 1,
                                            groupValue: gender,
                                            onChanged: (int? value) {
                                              gender = value!;
                                              setState(() {});
                                            }),
                                      ],
                                    ),
                                  ),
                                  Text(
                                    "3",
                                    style: TextStyle(fontSize: 15),
                                  )
                                ],
                              ),
                              Divider(
                                color: Colors.black.withOpacity(0.5),
                                indent: 15.0,
                                endIndent: 15.0,
                              ),
                              Row(
                                children: [
                                  vineta(),
                                  Container(
                                    width: 240,
                                    child: Expanded(
                                      child: Text(
                                        "TITULADO, DOBLE ESPECIALIDAD/ DIPLOMA",
                                        maxLines: 2,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    ),
                                  ),
                                  Container(
                                    height: 16,
                                    child: Row(
                                      children: [
                                        Radio(
                                            value: 1,
                                            groupValue: gender,
                                            onChanged: (int? value) {
                                              gender = value!;
                                              setState(() {});
                                            }),
                                      ],
                                    ),
                                  ),
                                  Text(
                                    "2",
                                    style: TextStyle(fontSize: 15),
                                  )
                                ],
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ))
          ],
        ));
  }
}

//clases
class vineta extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 10,
      width: 10,
      margin: EdgeInsets.only(right: 10),
      decoration:
          const BoxDecoration(color: Colors.amber, shape: BoxShape.circle),
    );
  }
}
