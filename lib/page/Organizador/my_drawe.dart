import 'package:flutter/material.dart';
import 'package:flutter_proyecto_1/page/Organizador/Convocatoria/home_convocatoria.dart';
import 'package:flutter_proyecto_1/page/Organizador/Evaluador/home_evaluador.dart';
import 'package:flutter_proyecto_1/page/Organizador/Participante/home_participante.dart';
import 'package:flutter_proyecto_1/page/Organizador/menu_page.dart';

class MyDrawe extends StatelessWidget {
  const MyDrawe({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          DrawerHeader(
              decoration: const BoxDecoration(
                  image: DecorationImage(
                      fit: BoxFit.cover,
                      image: AssetImage("assets/images/menu.jpg"))),
              child: SizedBox(
                width: double.infinity,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    CircleAvatar(
                      radius: 30,
                      backgroundImage:
                          AssetImage("assets/images/user-menu.jpg"),
                    ),
                    Text(
                      "JHON SANCHEZ ALARCON",
                      style: TextStyle(color: Colors.yellowAccent),
                    ),
                    Text(
                      "Organizador",
                      style: TextStyle(color: Colors.white),
                    ),
                  ],
                ),
              )),
          ListTile(
            onTap: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => MenuPage()));
            },
            leading: Icon(
              Icons.home,
              color: Colors.black.withOpacity(0.5),
            ),
            title: Text("Inicio"),
          ),
          ListTile(
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => HomeConvocatoria()));
            },
            leading: Icon(
              Icons.post_add,
              color: Colors.black.withOpacity(0.5),
            ),
            title: Text("Convocatorias"),
          ),
          ListTile(
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => HomeEvaluador()));
            },
            leading: Icon(
              Icons.supervised_user_circle_outlined,
              color: Colors.black.withOpacity(0.5),
            ),
            title: Text("Evaluados"),
          ),
          ListTile(
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => HomePaticipante()));
            },
            leading: Icon(
              Icons.person,
              color: Colors.black.withOpacity(0.5),
            ),
            title: Text("Participantes"),
          ),
        ],
      ),
    );
  }
}
