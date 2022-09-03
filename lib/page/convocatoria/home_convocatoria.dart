import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_proyecto_1/db/db_admin.dart';
import 'package:flutter_proyecto_1/models/convocatoria.dart';
import 'package:flutter_proyecto_1/models/evaluador.dart';
import 'package:flutter_proyecto_1/page/convocatoria/form_Convocatoria.dart';
import 'package:flutter_proyecto_1/ui/generales/textfield_normal_widget.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeConvocatoria extends StatefulWidget {
  const HomeConvocatoria({Key? key}) : super(key: key);

  @override
  State<HomeConvocatoria> createState() => _HomeConvocatoriaState();
}

class _HomeConvocatoriaState extends State<HomeConvocatoria> {
  final _formkey = GlobalKey<FormState>();
  final TextEditingController _tituConvocatoria = TextEditingController();

  guardarTitulo() {
    if (_formkey.currentState!.validate()) {
      ConvocatoriaModel model =
          ConvocatoriaModel(Titulo: _tituConvocatoria.text, Estado: "Activo");
      String dato = _tituConvocatoria.text;
      _tituConvocatoria.clear();
      DBAdmin.db.insertamosConvocatoria(model).then(
        (value) {
          if (value >= 0) {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (BuildContext context) => FormConvocatoria(
                          idConvocatoria: value,
                          textConvocatoria: dato,
                        )));
          }
        },
      );
    }
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
          title: Text("Lista de Convocatorias"),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            showFormConvocatoria();
          },
          child: const Icon(Icons.add),
        ),
        body: FutureBuilder(
            future: DBAdmin.db.getConvocatorias(),
            builder: (BuildContext context, AsyncSnapshot snap) {
              if (snap.data != null) {
                List<ConvocatoriaModel> model = snap.data;
                return ListView.builder(
                    itemCount: model.length,
                    itemBuilder: (BuildContext context, index) {
                      return ListTile(
                          title: Text(model[index].Titulo),
                          trailing: IconButton(
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (BuildContext context) =>
                                            FormConvocatoria(
                                              modelConvo: model[index],
                                            )));
                              },
                              icon: const Icon(Icons.edit)));
                    });
              }
              return const Center(
                child: CircularProgressIndicator(),
              );
            }));
  }
}
