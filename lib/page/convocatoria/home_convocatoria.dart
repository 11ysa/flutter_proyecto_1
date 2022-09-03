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
  ConvocatoriaModel? model; 
  final TextEditingController _tituConvocatoria = TextEditingController();

  guardarTitulo() {
    if (_formkey.currentState!.validate()) {
      ConvocatoriaModel model = ConvocatoriaModel(Titulo: _tituConvocatoria.text, Estado: "Activo");
      String dato = _tituConvocatoria.text;
                    _tituConvocatoria.clear();
      
      DBAdmin.db.insertamosConvocatoria(model).then(
        (value) {
          if (value >= 0) {
           ConvocatoriaModel modelo2 =ConvocatoriaModel(id: value,Titulo: dato,Estado: "Pendiente");
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
          
          title:const Text("Lista de Convocatorias"),
          centerTitle: true,
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

            if(snap.hasData){
               List<ConvocatoriaModel> listaConvo=snap.data;
                return ListView.builder(
                itemCount: listaConvo.length,
                itemBuilder: (BuildContext context, index) {
                  return ListTile(
                    title:Text(listaConvo[index].Titulo),
                    trailing:  IconButton(onPressed: (){
                     model=ConvocatoriaModel(id: listaConvo[index].id, Titulo: listaConvo[index].Titulo, Estado: "Activo");
                     Navigator.push(context, MaterialPageRoute(builder: (context)=> FormConvocatoria(modelConvo:model)));
                    }, 
                    icon:const Icon(Icons.edit)),
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
