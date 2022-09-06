import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_proyecto_1/db/db_admin.dart';
import 'package:flutter_proyecto_1/models/conevaluador.dart';
import 'package:flutter_proyecto_1/models/convocatoria.dart';
import 'package:flutter_proyecto_1/models/participante.dart';
import 'package:flutter_proyecto_1/page/convocatoria/form_items.dart';
import 'package:flutter_proyecto_1/page/convocatoria/home_convocatoria.dart';
import 'package:flutter_proyecto_1/page/convocatoria/widget_Evaluadores.dart';
import 'package:flutter_proyecto_1/page/convocatoria/widget_Participantes.dart';
import 'package:flutter_proyecto_1/page/convocatoria/widget_items.dart';
import 'package:flutter_proyecto_1/page/menu_page.dart';

import '../../ui/generales/colors.dart';

class FormConvocatoria extends StatefulWidget {
  ConvocatoriaModel? modelConvo;
  //modelo de editar
  FormConvocatoria({this.modelConvo});

  @override
  State<FormConvocatoria> createState() => _FormConvocatoriaState();
}

class _FormConvocatoriaState extends State<FormConvocatoria> {
  //variables Globales
  final TextEditingController _tituConvocato = TextEditingController();

  //procedimientos
  guardarConvocatoria() {
    //titulo
    ConvocatoriaModel modelConvocatoria = ConvocatoriaModel(
        id: widget.modelConvo!.id,
        Titulo: _tituConvocato.text,
        Estado: "Activo");
    DBAdmin.db.updateConvocatoria(modelConvocatoria);

    //evaluadores
    /*
    ConEvaluador modelConEvaluador =
        ConEvaluador(idevaluador: 1, idconvocatoria: widget.modelConvo.id);
    DBAdmin.db.insertamosConvocatoriaEvaluador(modelConEvaluador);
  */
  }

  obtenemosConvocatoria() {
    print("convocatora");
    print(DBAdmin.db.getConvocatorias());

    print("con evaluador");
    //eva con
    print(DBAdmin.db.getConvocatoriasEvaluadores(3, 2));
  }

  listarEvaluadores() {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return listarEvaluadores();
        });
  }

  obtenemosConvocatoriaEvaluador() {
    DBAdmin.db.getNombreEvaluadores(2);
  }

  TodoobtenemosConvocatoriaEvaluador() {
    DBAdmin.db.getConvocatoriaEvaluador();
  }

  //inicio
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setState(() {});
    _tituConvocato.text = widget.modelConvo!.Titulo;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text("Registrar Convocatoria"),
          centerTitle: true,
          backgroundColor: dcolorAppBar,
          leading: IconButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (BuildContext context) => HomeConvocatoria()));
              },
              icon: Icon(Icons.arrow_back))),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: Column(
            children: [
              TextField(
                style: TextStyle(fontSize: 18),
                maxLines: 1,
                controller: _tituConvocato,
                decoration: InputDecoration(
                    hintText: "Titulo de convocatoria",
                    suffixIcon: Icon(Icons.work),
                    prefixIcon: Icon(Icons.account_balance_sharp),
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(14)),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(14))),
              ),
              CardEvaluadores(model: widget.modelConvo),
              CardParticipantes(model: widget.modelConvo),
              const Padding(
                padding: EdgeInsets.all(3),
                child: Text(
                  "Items de Evaluacion",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
                ),
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(children: [
                  CardItems(),
                  CardItems(),
                  CardItems(),
                  CardItems(),
                  CardItems()
                ]),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(""),
                  const Icon(Icons.arrow_right_alt_outlined),
                  Container(
                    width: 30,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (BuildContext context) =>
                                    formItemes()));
                      },
                      child: Icon(
                        Icons.add,
                        size: 15,
                      ),
                      style: ElevatedButton.styleFrom(
                          shape: CircleBorder(), padding: EdgeInsets.all(5)),
                    ),
                  ),
                ],
              ),
              ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (BuildContext context) => MenuPage()));
                  },
                  child: Text("Terminar")),
              ElevatedButton(
                  onPressed: () {
                    obtenemosConvocatoria();
                  },
                  child: Text("obtener")),
            ],
          ),
        ),
      ),
    );
  }
}
