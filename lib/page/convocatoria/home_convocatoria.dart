// ignore_for_file: prefer_const_constructors

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_proyecto_1/page/convocatoria/widget_Evaluadores.dart';
import 'package:flutter_proyecto_1/page/convocatoria/widget_Participantes.dart';
import 'package:flutter_proyecto_1/ui/generales/colors.dart';

class HomeConvocatoria extends StatelessWidget {
  const HomeConvocatoria({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Convocatoria"),
        centerTitle: true,
        backgroundColor: dcolorAppBar,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            TextField(
              style: TextStyle(fontSize: 18),
              maxLines: 1,
              decoration: InputDecoration(
                  hintText: "Titulo de convocatoria",
                  suffixIcon: Icon(Icons.work),
                  prefixIcon: Icon(Icons.account_balance_sharp),
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(14)),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(14))),
            ),
            const SizedBox(
              height: 2,
            ),
            CardEvaluadores(),
            CardParticipantes(),
            Container(
              padding: EdgeInsets.all(10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Items de Evaluacion",
                    style: TextStyle(fontSize: 16),
                  ),
                  TextButton.icon(
                      onPressed: () {},
                      icon: Icon(Icons.add),
                      label: Text("Agregar"))
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                  color: Colors.cyan[100],
                  borderRadius: BorderRadius.circular(14),
                  boxShadow: [
                    BoxShadow(
                      blurRadius: 6,
                      color: Colors.black38,
                      offset: const Offset(4, 4),
                    )
                  ]),
              child: Column(
                children: [
                  Text(
                    "Titulos Academicos",
                    style: TextStyle(
                        color: Colors.indigo, fontWeight: FontWeight.bold),
                  ),
                  Divider(
                    indent: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Container(
                                  width: 200,
                                  child: Text(
                                    "Magister",
                                    maxLines: 1,
                                  )),
                              SizedBox(width: 10),
                              const Text("5",
                                  style: TextStyle(color: Colors.black))
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Container(
                                  width: 200,
                                  child: Text(
                                    "Magister Con titulacion ",
                                    maxLines: 1,
                                  )),
                              SizedBox(width: 10),
                              const Text(
                                "4",
                                style: TextStyle(color: Colors.black),
                              )
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Container(
                                  width: 200,
                                  child: Text(
                                    "Tecnico con especialidd",
                                    maxLines: 1,
                                  )),
                              SizedBox(width: 10),
                              const Text("3",
                                  style: TextStyle(color: Colors.black))
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Container(
                                  width: 200,
                                  child: Text(
                                    "Sin Titulo",
                                    maxLines: 1,
                                  )),
                              SizedBox(width: 10),
                              const Text(
                                "2",
                                style: TextStyle(color: Colors.black),
                              )
                            ],
                          ),
                        ],
                      ),
                      Container(
                        padding:
                            EdgeInsets.symmetric(vertical: 10, horizontal: 8),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: const [
                                Text(
                                  "Peso:",
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w600),
                                ),
                                SizedBox(
                                  width: 5,
                                ),
                                Text(
                                  "80 %",
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w600),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Icon(
                                  Icons.star,
                                  color: Colors.amberAccent[700],
                                ),
                                Icon(
                                  Icons.star,
                                  color: Colors.amberAccent[700],
                                ),
                                Icon(
                                  Icons.star,
                                  color: Colors.amberAccent[700],
                                ),
                                Icon(
                                  Icons.star,
                                  color: Colors.amberAccent[700],
                                ),
                                Icon(
                                  Icons.star,
                                  color: Colors.white,
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
