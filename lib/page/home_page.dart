// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_proyecto_1/page/Evaluador/home_evaluador.dart';
import 'package:flutter_proyecto_1/page/menu_page.dart';
import 'package:flutter_proyecto_1/ui/generales/colors.dart';

class HomePage extends StatelessWidget {
  TextEditingController codigo = TextEditingController();

  showOrganizador(BuildContext context) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
            title: Text("Ingrese Codigo Acceso"),
            content: TextField(
              controller: codigo,
              decoration: InputDecoration(hintText: "Codigo"),
            ),
            actions: [
              TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text("Cancelar")),
              TextButton(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => HomePage()));
                  },
                  child: Text("Aceptar"))
            ],
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "SySublime",
              style: TextStyle(
                color: Colors.white,
                fontSize: 22,
                fontWeight: FontWeight.w100,
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Text(
              "Ficha de Evaluacion del Curriculun Vitae",
              style: TextStyle(
                  color: Colors.black87,
                  fontSize: 26,
                  fontWeight: FontWeight.normal),
            ),
            SizedBox(
              height: 30,
            ),
            Text(
              "Reclutamiento Organizacional",
              style: TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.w100,
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Container(
              width: double.infinity,
              height: 200,
              child: Image.asset(
                "assets/images/home.png",
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(
              height: 30,
            ),
            SizedBox(
              width: double.infinity,
              height: 54,
              child: ElevatedButton.icon(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => MenuPage()));
                  },
                  style: ElevatedButton.styleFrom(
                      primary: dcolorButon1,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(14))),
                  icon: Icon(Icons.person),
                  label: Text("ORGANIZADOR")),
            ),
            SizedBox(
              height: 10,
            ),
            SizedBox(
              width: double.infinity,
              height: 54,
              child: ElevatedButton.icon(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => HomeEvaluador()));
                  },
                  style: ElevatedButton.styleFrom(
                      primary: dcolorButon2,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(14))),
                  icon: Icon(Icons.supervised_user_circle_outlined),
                  label: Text("EVALUADOR")),
            )
          ],
        ),
      ),
    );
  }
}
