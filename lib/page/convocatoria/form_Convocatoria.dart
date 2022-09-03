import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_proyecto_1/db/db_admin.dart';
import 'package:flutter_proyecto_1/models/conevaluador.dart';
import 'package:flutter_proyecto_1/models/convocatoria.dart';
import 'package:flutter_proyecto_1/page/convocatoria/widget_Evaluadores.dart';

import '../../ui/generales/colors.dart';

class FormConvocatoria extends StatefulWidget {
  ConvocatoriaModel? modelConvo; //modelo de editar
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
    print("todos");
    print(widget.modelConvo!.id);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Registrar Convocatoria"),
        centerTitle: true,
        backgroundColor: dcolorAppBar,
      ),
      body: Padding(
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
         
            CardEvaluadores(
              idConvocatoria:widget.modelConvo!.id,
            ),

            ElevatedButton(
                onPressed: () {
                  guardarConvocatoria();
                },
                child: Text("Convocatoria Guardar")),
            ElevatedButton(
                onPressed: () {
                  obtenemosConvocatoria();
                },
                child: Text("obtener")),
            ElevatedButton(
                onPressed: () {
                  obtenemosConvocatoriaEvaluador();
                },
                child: Text("obtenemosConvocator1")),
            ElevatedButton(
                onPressed: () {
                  TodoobtenemosConvocatoriaEvaluador();
                },
                child: Text("TodoosConvocatoriaEvaluador"))
          ],
        ),
      ),
    );
  }
}
