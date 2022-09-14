import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_proyecto_1/db/db_admin.dart';
import 'package:flutter_proyecto_1/models/convocatoria.dart';
import 'package:flutter_proyecto_1/models/evaluador.dart';
import 'package:flutter_proyecto_1/page/convocatoria/form_Convocatoria.dart';
import 'package:flutter_proyecto_1/page/menu_page.dart';
import 'package:flutter_proyecto_1/ui/generales/textfield_normal_widget.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeConvocatoria extends StatefulWidget {
  const HomeConvocatoria({Key? key}) : super(key: key);
  @override
  State<HomeConvocatoria> createState() => _HomeConvocatoriaState();
}

class _HomeConvocatoriaState extends State<HomeConvocatoria> {
  final _formkey = GlobalKey<FormState>();
  ConvocatoriaModel? model;
  final TextEditingController _tituConvocatoria = TextEditingController();
  final TextEditingController _tituConvocatoriaUpdate = TextEditingController();

  guardarTitulo() {
    if (_formkey.currentState!.validate()) {
      ConvocatoriaModel model =
          ConvocatoriaModel(Titulo: _tituConvocatoria.text, Estado: "Activo");
      String dato = _tituConvocatoria.text;
      _tituConvocatoria.clear();

      DBAdmin.db.insertamosConvocatoria(model).then(
        (value) {
          if (value >= 0) {
            ConvocatoriaModel modelo2 =
                ConvocatoriaModel(id: value, Titulo: dato, Estado: "Pendiente");
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (BuildContext context) => FormConvocatoria(
                          modelConvo: modelo2,
                        )));
          }
        },
      );
    }
  }

  updateTitulo(int id) {
    if (_formkey.currentState!.validate()) {
      ConvocatoriaModel model =
          ConvocatoriaModel(id: id, Titulo: _tituConvocatoriaUpdate.text);
      _tituConvocatoriaUpdate.clear();

      DBAdmin.db.updateConvocatoria(model).then(
        (value) {
          if (value >= 0) {
            Navigator.pop(context);
            setState(() {});
          }
        },
      );
    }
  }

  ModificamosTitulo(int id) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            contentPadding: EdgeInsets.all(8.0),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(14.0)),
            content: Form(
              key: _formkey,
              child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    TextFieldNormalWidget(
                        hintText: "Titulo De Convocatoria",
                        icon: "newConvocatoria",
                        isDNI: false,
                        controller: _tituConvocatoriaUpdate,
                        campoNumerico: false),
                    const Divider(
                      thickness: 0.7,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        TextButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: Text("Cancelar")),
                        TextButton(
                          onPressed: () {
                            updateTitulo(id);
                          },
                          child: Text("Actualizar"),
                        )
                      ],
                    ),
                  ]),
            ),
          );
        });
  }

  showFormConvocatoria() {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            contentPadding: EdgeInsets.all(8.0),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(14.0)),
            content: Form(
              key: _formkey,
              child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    TextFieldNormalWidget(
                        hintText: "Titulo De Convocatoria",
                        icon: "newConvocatoria",
                        isDNI: false,
                        controller: _tituConvocatoria,
                        campoNumerico: false),
                    const Divider(
                      thickness: 0.7,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        TextButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: Text("Cancelar")),
                        TextButton(
                          onPressed: () {
                            guardarTitulo();
                          },
                          child: Text("Aceptar"),
                        )
                      ],
                    ),
                  ]),
            ),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: const Text("Lista de Convocatorias"),
            centerTitle: true,
            leading: IconButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (BuildContext context) => MenuPage()));
                },
                icon: Icon(Icons.arrow_back))),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            showFormConvocatoria();
          },
          child: const Icon(Icons.add),
        ),
        body: FutureBuilder(
          future: DBAdmin.db.getConvocatorias(),
          builder: (BuildContext context, AsyncSnapshot snap) {
            if (snap.hasData) {
              List<ConvocatoriaModel> listaConvo = snap.data;
              return ListView.builder(
                  itemCount: listaConvo.length,
                  itemBuilder: (BuildContext context, index) {
                    return ListTile(
                      title: Text(listaConvo[index].Titulo!),
                      trailing: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          IconButton(
                              onPressed: () {
                                model = ConvocatoriaModel(
                                    id: listaConvo[index].id,
                                    Titulo: listaConvo[index].Titulo,
                                    Estado: "Editar");
                                _tituConvocatoriaUpdate.text =
                                    listaConvo[index].Titulo!;
                                ModificamosTitulo(listaConvo[index].id!);
                              },
                              icon: const Icon(Icons.edit)),
                          IconButton(
                              onPressed: () {
                                model = ConvocatoriaModel(
                                    id: listaConvo[index].id,
                                    Titulo: listaConvo[index].Titulo,
                                    Estado: "Editar");
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => FormConvocatoria(
                                            modelConvo: model)));
                              },
                              icon: const Icon(Icons.remove_red_eye_sharp)),
                        ],
                      ),
                    );
                  });
            }
            return const Center(
              child: CircularProgressIndicator(),
            );
          },
        ));
  }
}
