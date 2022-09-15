import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_proyecto_1/db/db_admin.dart';
import 'package:flutter_proyecto_1/models/conevaluador.dart';
import 'package:flutter_proyecto_1/models/convocatoria.dart';
import 'package:flutter_proyecto_1/models/items.dart';
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
  int ItemsPorceTatal = 0;

  //procedimientos
  guardarConvocatoria() {
    //titulo
    ConvocatoriaModel modelConvocatoria = ConvocatoriaModel(
        id: widget.modelConvo!.id,
        Titulo: _tituConvocato.text,
        Estado: "Activo");
    DBAdmin.db.updateConvocatoria(modelConvocatoria);
  }
 deleteItems(int id){
    DBAdmin.db.deleteItems(id).then((value) {
        if (value > 0){
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Row(children: const [  Icon(Icons.check_circle, color: Colors.white),
            SizedBox(width: 10),
            Text("Items Eliminado")]),
          ));
        }
    });
  }
  obtenemosConvocatoria() {}

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

  optenemosTotal() {
    int? numero = widget.modelConvo!.id;
    DBAdmin.db.getItemsPorcentajeTotal(numero!);
  }

  int? idconvocatoria;
  //inicio
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setState(() {});
    idconvocatoria = widget.modelConvo!.id;
    DBAdmin.db.getConvocatoria(idconvocatoria!).then((value) {
      _tituConvocato.text = value[0].Titulo.toString();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text("Registrar Convocatoria"),
          centerTitle: true,
          backgroundColor: dcolorAppBar,
          actions: [
            IconButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (BuildContext context) => MenuPage()));
                },
                icon: Icon(Icons.home))
          ],
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
              //OBTENEMOS LA LISTA
              SizedBox(
                  width: double.infinity,
                  height: 150,
                  child: FutureBuilder(
                    future: DBAdmin.db.getItems(idconvocatoria!),
                    builder: (BuildContext context, AsyncSnapshot snap) {
                      if (snap.hasData) {
                        List<ItemsModel> listModel = snap.data;
                        List<ConvocatoriaModel>? listmodelcon;
                        return ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: listModel.length,
                            itemBuilder: (BuildContext ctx, index) {
                              return Dismissible(
                                key: UniqueKey(),
                                direction:DismissDirection.vertical,
                                background: Container(color: Colors.amber),
                                onDismissed: (DismissDirection direction) {
                                           deleteItems(listModel[index].idconvocatoria);
                                },
                                child: CardItems(
                                  modelItems: listModel[index],
                                  modelConvo: ConvocatoriaModel(
                                      id: listModel[index].idconvocatoria),
                                ),
                              );
                            });
                      }
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    },
                  )),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(""),
                  const Icon(Icons.arrow_right_alt_outlined),
                  Container(
                    width: 30,
                    child: ElevatedButton(
                      onPressed: () {
                        DBAdmin.db
                            .getItemsPorcentajeTotal(idconvocatoria!)
                            .then((value) {
                          print("value $value");
                          if (value < 100) {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (BuildContext context) =>
                                        FormItems(
                                          modelConvo: widget.modelConvo,
                                          TotalItems: value,
                                        )));
                          } else {
                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                                backgroundColor: Colors.amberAccent,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(14)),
                                duration: const Duration(milliseconds: 1600),
                                behavior: SnackBarBehavior.floating,
                                content: Row(
                                
                                  children: const [
                                    Icon(
                                      Icons.warning,
                                      color: Colors.black,
                                    ),
                                    SizedBox(
                                      width: 10.0,
                                    ),
                                    Text(
                                      "Items Supera El 100 % ",
                                      style: TextStyle(color: Colors.black),
                                    )
                                  ],
                                )));
                          }
                        });
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
                  child: Text("FINALIZAR REGISTRO")),
              
              
            ],
          ),
        ),
      ),
    );
  }
}
