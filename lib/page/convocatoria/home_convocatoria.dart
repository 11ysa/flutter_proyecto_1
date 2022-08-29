import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_proyecto_1/db/db_admin.dart';
import 'package:flutter_proyecto_1/page/convocatoria/form_Convocatoria.dart';

class HomeConvocatoria extends StatefulWidget {
  const HomeConvocatoria({Key? key}) : super(key: key);

  @override
  State<HomeConvocatoria> createState() => _HomeConvocatoriaState();
}

class _HomeConvocatoriaState extends State<HomeConvocatoria> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Lista de Convocatorias"),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (BuildContext context) => FormConvocatoria()));
          },
          child: const Icon(Icons.add),
        ),
        body: FutureBuilder(
          future: DBAdmin.db.getConvocatorias(),
          builder: (BuildContext context, AsyncSnapshot snap) {
            return ListView.builder(
                itemCount: 5,
                itemBuilder: (BuildContext context, index) {
                  return Text("data");
                });
          },
        ));
  }
}
