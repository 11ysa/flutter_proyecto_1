import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_proyecto_1/db/db_admin.dart';
import 'package:flutter_proyecto_1/models/evaluador.dart';
import 'package:flutter_proyecto_1/page/Evaluacion/list_convocatorias.dart';
import 'package:flutter_proyecto_1/page/Organizador/menu_page.dart';
import 'package:flutter_proyecto_1/ui/animacion.dart';
import 'package:flutter_proyecto_1/ui/generales/messege.dart';

class LoginPage extends StatefulWidget {
  String type;

  LoginPage({required this.type});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  EvaluadorModel? modelEvaluador;
  //variables
  final TextEditingController _identidadController = TextEditingController();
  final TextEditingController _claveController = TextEditingController();
  final TextEditingController _nombre = TextEditingController();
  final _formkey = GlobalKey<FormState>();
  String nombre = "";
  EvaluadorModel? modelEvalu;

  _login() {
    if (_formkey.currentState!.validate()) {
      String identidad = _identidadController.text;
      String clave = _claveController.text;
      if (nombre == 'Evaluador') {
        DBAdmin.db.getLoginEvaluador(identidad, clave).then((value) {
          if (value != null) {
            modelEvalu = EvaluadorModel(
                id: value[0].id,
                nombre: value[0].nombre,
                apellidos: value[0].apellidos,
                dni: value[0].dni,
                area: value[0].area,
                clave: value[0].clave,
                jerarquia: value[0].jerarquia);
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) =>
                      ListConvocatoriasActivas(model: modelEvalu!),
                ));
          } else {
            showSnackBarError(context, "Credenciales incorrectas");
          }
        });
      } else {
        DBAdmin.db.getLoginEvaluador(identidad, clave).then((value) {
          if (value != null) {
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => MenuPage(),
                ));
          } else {
            showSnackBarError(context, "Credenciales incorrectas");
          }
        });
      }
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    nombre = widget.type.toString();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                // Colors.purple,
                Color(0xff363f93),
                Colors.purpleAccent,
              ]),
        ),
        child: Column(
          children: [
            Container(
                margin: const EdgeInsets.only(top: 100),
                child: Animacion(
                  2,
                  Text(
                    nombre,
                    style: const TextStyle(
                      fontSize: 35,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      letterSpacing: 3,
                    ),
                  ),
                )),
            Expanded(
              child: Container(
                  width: double.infinity,
                  decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(50),
                          topRight: Radius.circular(50))),
                  margin: const EdgeInsets.only(top: 60),
                  child: SingleChildScrollView(
                    child: Form(
                      key: _formkey,
                      child: Column(
                        children: [
                          const SizedBox(
                            height: 50,
                          ),
                          Container(
                              // color: Colors.red,
                              alignment: Alignment.topLeft,
                              margin:
                                  const EdgeInsets.only(left: 22, bottom: 20),
                              child: const Animacion(
                                2,
                                Text(
                                  "Iniciar Seccion",
                                  style: TextStyle(
                                      fontSize: 35,
                                      color: Colors.black87,
                                      letterSpacing: 2,
                                      fontFamily: "Lobster"),
                                ),
                              )),
                          Animacion(
                            2,
                            Container(
                                width: double.infinity,
                                height: 70,
                                margin: const EdgeInsets.symmetric(
                                    horizontal: 20, vertical: 20),
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 15, vertical: 5),
                                decoration: BoxDecoration(
                                    border: Border.all(
                                        color: Color(0xff363f93), width: 1),
                                    boxShadow: const [
                                      BoxShadow(
                                          color: Color(0xff363f93),
                                          blurRadius: 10,
                                          offset: Offset(1, 1)),
                                    ],
                                    color: Colors.white,
                                    borderRadius: const BorderRadius.all(
                                        Radius.circular(20))),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    const Icon(Icons.person),
                                    Expanded(
                                      child: Container(
                                        margin: const EdgeInsets.only(left: 10),
                                        child: TextFormField(
                                          controller: _identidadController,
                                          keyboardType: TextInputType.number,
                                          maxLines: 1,
                                          decoration: const InputDecoration(
                                            label: Text("Numero de Identidad"),
                                            border: InputBorder.none,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                )),
                          ),
                          Animacion(
                            2,
                            Container(
                                width: double.infinity,
                                height: 70,
                                margin: const EdgeInsets.symmetric(
                                    horizontal: 20, vertical: 20),
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 15, vertical: 5),
                                decoration: BoxDecoration(
                                    border: Border.all(
                                        color: const Color(0xff363f93),
                                        width: 1),
                                    boxShadow: const [
                                      BoxShadow(
                                          color: Color(0xff363f93),
                                          blurRadius: 10,
                                          offset: Offset(1, 1)),
                                    ],
                                    color: Colors.white,
                                    borderRadius: const BorderRadius.all(
                                        Radius.circular(20))),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    const Icon(Icons.password_outlined),
                                    Expanded(
                                      child: Container(
                                        margin: const EdgeInsets.only(left: 10),
                                        child: TextFormField(
                                          controller: _claveController,
                                          keyboardType: TextInputType.number,
                                          maxLines: 1,
                                          decoration: const InputDecoration(
                                            label: Text("Clave de Acceso "),
                                            border: InputBorder.none,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                )),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Animacion(
                            2,
                            ElevatedButton(
                              onPressed: () {},
                              style: ElevatedButton.styleFrom(
                                  onPrimary: const Color(0xff363f93),
                                  shadowColor: Colors.purpleAccent,
                                  elevation: 18,
                                  padding: EdgeInsets.zero,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(20))),
                              child: Ink(
                                decoration: BoxDecoration(
                                    gradient: const LinearGradient(colors: [
                                      Color(0xff363f93),
                                      Colors.deepPurple
                                    ]),
                                    borderRadius: BorderRadius.circular(20)),
                                child: Container(
                                    width: 200,
                                    height: 50,
                                    alignment: Alignment.center,
                                    child: TextButton(
                                      onPressed: () {
                                        _login();
                                      },
                                      child: const Text(
                                        'Login',
                                        style: TextStyle(
                                          fontSize: 30,
                                          color: Colors.white,
                                        ),
                                      ),
                                    )),
                              ),
                            ),
                          ),
                          Animacion(
                            2,
                            Container(
                                width: double.infinity,
                                height: 70,
                                alignment: Alignment.center,
                                margin: const EdgeInsets.only(top: 10),
                                child: const Text(
                                  " Volver a inicio ",
                                  style: TextStyle(
                                      color: Colors.black54, fontSize: 15),
                                )),
                          ),
                        ],
                      ),
                    ),
                  )),
            )
          ],
        ),
      ),
    );
  }
}
