import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_proyecto_1/db/db_admin.dart';
import 'package:flutter_proyecto_1/models/convocatoria.dart';
import 'package:flutter_proyecto_1/models/items.dart';
import 'package:flutter_proyecto_1/page/convocatoria/form_Convocatoria.dart';
import 'package:flutter_proyecto_1/ui/generales/colors.dart';
import 'package:flutter_proyecto_1/ui/generales/textfield_normal_widget.dart';

import 'list_porcentaje.dart';

class FormItems extends StatefulWidget {
  ConvocatoriaModel? modelConvo;
  ItemsModel? modelItems;
  ConvocatoriaModel? modelItemsConvo;
  int? TotalItems;

  FormItems(
      {this.modelConvo,
      this.modelItems,
      this.modelItemsConvo,
      this.TotalItems});

  @override
  State<FormItems> createState() => _FormItemsState();
}

class _FormItemsState extends State<FormItems> {
  /* Variables */
  final _formkey = GlobalKey<FormState>();
  final TextEditingController _titulo = TextEditingController();
  final TextEditingController _des5 = TextEditingController();
  final TextEditingController _des4 = TextEditingController();
  final TextEditingController _des3 = TextEditingController();
  final TextEditingController _des2 = TextEditingController();
  final TextEditingController _porcentaje = TextEditingController();
  String valorPorce = "10";
  int? idconvocatoria;

  /* lista de porcentajes */
  List<String> listaPorc(int TotalItems) {
    List<String> lista = [];
    int valor = TotalItems; // valor inicializado
    double variable = (100 - valor) / 10;
    for (var i = 1; i <= variable; i++) {
      int contador = i * 10;
      lista.add(contador.toString());
    }
    return lista;
  }

  /* mostrar porcentaje */
  GuardarItems() {
    if (_formkey.currentState!.validate()) {
      ItemsModel model = ItemsModel(
          idconvocatoria: idconvocatoria!,
          titulo: _titulo.text,
          porcentaje: int.parse(_porcentaje.text),
          des5: _des5.text,
          des4: _des4.text,
          des3: _des3.text,
          des2: _des2.text);
      if (widget.modelItems == null) {
        DBAdmin.db.insertamosItems(model).then((value) {
          if (value > 0) {
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                backgroundColor: Colors.indigo,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(14)),
                duration: const Duration(milliseconds: 1400),
                behavior: SnackBarBehavior.floating,
                content: Row(
                  children: const [
                    Icon(
                      Icons.check_circle,
                      color: Colors.white,
                    ),
                    Text("Items Registrado")
                  ],
                )));

            _titulo.clear();
            _des2.clear();
            _des3.clear();
            _des2.clear();
          }
        });
      } else {
        model.id = widget.modelItems!.id!;
        DBAdmin.db.updateItems(model).then((value) {
          if (value > 0) {
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                backgroundColor: Colors.indigo,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(14)),
                duration: const Duration(milliseconds: 1400),
                behavior: SnackBarBehavior.floating,
                content: Row(
                  children: const [
                    Icon(
                      Icons.check_circle,
                      color: Colors.white,
                    ),
                    Text("Items Modificado")
                  ],
                )));

            _titulo.clear();
            _des2.clear();
            _des3.clear();
            _des2.clear();
          }
        });
      }
    }
  }

  Widget ListPorcentaje(int TotalItems) {
    List<String> lista = listaPorc(TotalItems);
    return Container(
      height: 300.0,
      width: 300.0,
      child: ListView.builder(
        shrinkWrap: true,
        itemCount: lista.length,
        itemBuilder: (BuildContext context, int index) {
          return GestureDetector(
            onTap: () {
              valorPorce = lista[index].toString();
              _porcentaje.text = valorPorce;
              Navigator.pop(context);
              setState(() {});
            },
            child: ListTile(
                title: Row(
              children: [Text(lista[index]), const Text("%")],
            )),
          );
        },
      ),
    );
  }

  showListPorcentaje(int TotalItems) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Porcentaje de evaluacion'),
            content: ListPorcentaje(TotalItems),
          );
        });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _porcentaje.text = valorPorce.toString();
    //print(widget.TotalItems);

    if (widget.modelConvo != null) {
      //modificar
      idconvocatoria = widget.modelConvo!.id;
    }
    if (widget.modelItems != null) {
      idconvocatoria = widget.modelItems!.idconvocatoria;
      _titulo.text = widget.modelItems!.titulo;
      _des5.text = widget.modelItems!.des5;
      _des4.text = widget.modelItems!.des4;
      _des3.text = widget.modelItems!.des3;
      _des2.text = widget.modelItems!.des2;
      _porcentaje.text = widget.modelItems!.porcentaje.toString();
      valorPorce = _porcentaje.text;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Registrar Nuevo Items"),
          backgroundColor: dcolorAppBar,
        ),
        body: Form(
          key: _formkey,
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  const Padding(
                    padding: EdgeInsets.all(10),
                    child: Text("Apariencia de Evaluacion",
                        style: TextStyle(
                            fontSize: 15, fontWeight: FontWeight.w500)),
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
                        style: TextStyle(
                            fontSize: 15, fontWeight: FontWeight.w500)),
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
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Visibility(
                              visible: true,
                              child: Container(
                                  width: 130,
                                  child: TextFieldNormalWidget(
                                    hintText: "% de evaluacion",
                                    icon: "link",
                                    isDNI: false,
                                    controller: _porcentaje,
                                    campoNumerico: false,
                                  )),
                            ),
                            Container(
                                width: 150,
                                height: 100,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text("$valorPorce %",
                                        style: TextStyle(
                                            fontSize: 30,
                                            fontWeight: FontWeight.w500)),
                                    SizedBox(width: 10),
                                    ElevatedButton.icon(
                                        onPressed: () {
                                          if (widget.modelItems != null) {
                                            DBAdmin.db
                                                .getItemsPorcentajeTotal(widget
                                                    .modelItems!.idconvocatoria)
                                                .then((value) {
                                              showListPorcentaje(value);
                                            });
                                          } else {
                                            showListPorcentaje(
                                                widget.TotalItems!);
                                          }
                                        },
                                        icon: Icon(Icons.search),
                                        label: Text(""))
                                  ],
                                )),
                          ],
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    width: double.infinity,
                    height: 50,
                    child: ElevatedButton.icon(
                      onPressed: () {
                        GuardarItems();

                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => FormConvocatoria(
                                      modelConvo: widget.modelConvo,
                                    )));
                      },
                      icon: const Icon(Icons.save),
                      label: const Text("Guardar"),
                      style: ElevatedButton.styleFrom(
                          primary: dcolorButon2,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(14))),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}
