import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_proyecto_1/ui/generales/colors.dart';
import 'package:flutter_proyecto_1/ui/generales/textfield_normal_widget.dart';

import 'list_porcentaje.dart';

class formItemes extends StatefulWidget {
  const formItemes({Key? key}) : super(key: key);

  @override
  State<formItemes> createState() => _formItemesState();
}

class _formItemesState extends State<formItemes> {
  /* Variables */
  TextEditingController _titulo = TextEditingController();
  TextEditingController _des5 = TextEditingController();
  TextEditingController _des4 = TextEditingController();
  TextEditingController _des3 = TextEditingController();
  TextEditingController _des2 = TextEditingController();

  /* mostrar porcentaje */

  Widget ListPorcentaje() {
    return Container(
      height: 300.0,
      width: 300.0,
      child: ListView.builder(
        shrinkWrap: true,
        itemCount: 5,
        itemBuilder: (BuildContext context, int index) {
          return ListTile(
            title: Text('20 %'),
          );
        },
      ),
    );
  }

  showListPorcentaje() {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Porcentaje de evaluacion'),
            content: ListPorcentaje(),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Registrar Nuevo Items"),
          backgroundColor: dcolorAppBar,
        ),
        body: Padding(
          padding: const EdgeInsets.all(10),
          child: SingleChildScrollView(
            child: Column(
              children: [
                const Padding(
                  padding: EdgeInsets.all(10),
                  child: Text("Apariencia de Evaluacion",
                      style:
                          TextStyle(fontSize: 15, fontWeight: FontWeight.w500)),
                ),
                TextFieldNormalWidget(
                  hintText: "Titulo ",
                  icon: "evaluation",
                  isDNI: false,
                  controller: _titulo,
                  campoNumerico: false,
                  maxlineas: 1,
                ),
                const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text("Parametros Iniciales",
                      style:
                          TextStyle(fontSize: 15, fontWeight: FontWeight.w500)),
                ),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Column(
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(right: 10),
                            child: Container(
                                width: 280,
                                child: const Text(
                                  "Consepto",
                                  style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.w500),
                                  textAlign: TextAlign.start,
                                )),
                          ),
                          Container(
                            width: 80,
                            child: const Text(
                              "Puntuacion",
                              style: TextStyle(
                                  fontSize: 15, fontWeight: FontWeight.w500),
                              textAlign: TextAlign.center,
                            ),
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      //conse

                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(right: 10),
                            child: Container(
                                width: 290,
                                child: TextFieldNormalWidget(
                                  hintText: "Describir Parametro N° 1",
                                  icon: "list",
                                  isDNI: false,
                                  controller: _des5,
                                  campoNumerico: false,
                                )),
                          ),
                          Container(
                            width: 70,
                            child: const Text(
                              "5",
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.w500),
                              textAlign: TextAlign.center,
                            ),
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(right: 10),
                            child: Container(
                                width: 290,
                                child: TextFieldNormalWidget(
                                  hintText: "Describir Parametro N° 2",
                                  icon: "list",
                                  isDNI: false,
                                  controller: _des4,
                                  campoNumerico: false,
                                )),
                          ),
                          Container(
                            width: 70,
                            child: const Text(
                              "4",
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.w500),
                              textAlign: TextAlign.center,
                            ),
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(right: 10),
                            child: Container(
                                width: 290,
                                child: TextFieldNormalWidget(
                                  hintText: "Describir Parametro N° 3",
                                  icon: "list",
                                  isDNI: false,
                                  controller: _des3,
                                  campoNumerico: false,
                                )),
                          ),
                          Container(
                            width: 70,
                            child: const Text(
                              "3",
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.w500),
                              textAlign: TextAlign.center,
                            ),
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(right: 10),
                            child: Container(
                                width: 290,
                                child: TextFieldNormalWidget(
                                  hintText: "Describir Parametro N° 2",
                                  icon: "list",
                                  isDNI: false,
                                  controller: _des2,
                                  campoNumerico: false,
                                )),
                          ),
                          Container(
                            width: 70,
                            child: const Text(
                              "2",
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.w500),
                              textAlign: TextAlign.center,
                            ),
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Container(
                        child: ElevatedButton(
                            onPressed: () {
                              showListPorcentaje();
                            },
                            child: Text("Porcentaje")),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
