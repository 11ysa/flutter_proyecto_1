import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_proyecto_1/models/Evaluador.dart';

import '../../db/db_admin.dart';
import '../../ui/generales/colors.dart';
import '../../ui/generales/textfield_normal_widget.dart';

class FormEvaluador extends StatefulWidget {
  EvaluadorModel? eModel;

  FormEvaluador({this.eModel});

  @override
  State<FormEvaluador> createState() => _FormEvaluadorState();
}

class _FormEvaluadorState extends State<FormEvaluador> {
  /* Variables */

  final TextEditingController _nombreController = TextEditingController();
  final TextEditingController _apellidosController = TextEditingController();
  final TextEditingController _dniController = TextEditingController();
  final TextEditingController _areaController = TextEditingController();
  final TextEditingController _claveController = TextEditingController();

  final _formkey = GlobalKey<FormState>();
  int gender = 1;

  /* inicio */
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    if (widget.eModel != null) {
      _nombreController.text = widget.eModel!.nombre;
      _apellidosController.text = widget.eModel!.apellidos;
      _dniController.text = widget.eModel!.dni;
      _areaController.text = widget.eModel!.area;
      _claveController.text = widget.eModel!.clave.toString();
      switch (widget.eModel!.jerarquia) {
        case "Colaborador":
          gender = 2;
          break;
        case "Asistente":
          gender = 3;
          break;

        default:
          gender = 1;
      }
    }
  }

  /*procedimientos*/

  //gerarquias
  String jerarqui() {
    switch (gender) {
      case 2:
        {
          return "Colaborador";
        }

      case 3:
        {
          return "Asistente";
        }

      default:
        {
          return "Jefe";
        }
    }
  }

  //insertar nuevo participante
  guardarEvaluador() {
    if (_formkey.currentState!.validate()) {
      EvaluadorModel model = EvaluadorModel(
          nombre: _nombreController.text,
          apellidos: _apellidosController.text,
          dni: _dniController.text,
          area: _areaController.text,
          clave: int.parse(_claveController.text),
          jerarquia: jerarqui());
      if (widget.eModel == null) {
        DBAdmin.db.insertEvaluador(model).then((value) {
          if (value > 0) {
            Navigator.pop(context);
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                backgroundColor: Colors.indigo,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(14)),
                duration: const Duration(milliseconds: 1400),
                behavior: SnackBarBehavior.floating,
                content: Row(
                  children: const [
                    Icon(
                      Icons.check_circle,
                      color: Colors.white,
                    ),
                    SizedBox(
                      width: 10.0,
                    ),
                    Text("Evaluador Registrado con exito")
                  ],
                )));
          }
        });
      } else {
        model.id = widget.eModel!.id!;
        DBAdmin.db.updateEvaluador(model).then((value) {
          if (value > 0) {
            Navigator.pop(context);
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                backgroundColor: Colors.indigo,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(14)),
                duration: const Duration(milliseconds: 1400),
                behavior: SnackBarBehavior.floating,
                content: Row(
                  children: const [
                    Icon(
                      Icons.check_circle,
                      color: Colors.white,
                    ),
                    SizedBox(
                      width: 10.0,
                    ),
                    Text("Evaluador Modificado con exito")
                  ],
                )));
          }
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: AlertDialog(
        title: widget.eModel != null
            ? Text("Modificar Evaluador")
            : Text("Nuevo Evaluador"),
        elevation: 10,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
        content: Form(
          key: _formkey,
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Divider(height: 10),
                TextFieldNormalWidget(
                  hintText: "Nombres",
                  icon: 'user',
                  isDNI: false,
                  controller: _nombreController,
                  campoNumerico: false,
                ),
                TextFieldNormalWidget(
                    hintText: "Apellidos",
                    icon: "bx-user-plus",
                    isDNI: false,
                    controller: _apellidosController,
                    campoNumerico: false),
                TextFieldNormalWidget(
                    hintText: "DNI",
                    icon: "id-card",
                    isDNI: true,
                    controller: _dniController,
                    campoNumerico: true),
                TextFieldNormalWidget(
                    hintText: "Area Trabajo",
                    icon: "bx-ege",
                    isDNI: false,
                    controller: _areaController,
                    campoNumerico: false),
                TextFieldNormalWidget(
                    hintText: "Clave de Acceso",
                    icon: "bx-lock",
                    isDNI: false,
                    controller: _claveController,
                    campoNumerico: true),
                RadioListTile(
                    contentPadding: EdgeInsets.all(2),
                    value: 1,
                    groupValue: gender,
                    title: const Text("Jefe"),
                    onChanged: (int? value) {
                      gender = value!;
                      print(jerarqui());
                      setState(() {});
                    }),
                RadioListTile(
                    contentPadding: EdgeInsets.all(2),
                    value: 2,
                    groupValue: gender,
                    title: const Text("Colaborador"),
                    onChanged: (int? value) {
                      gender = value!;
                      print(jerarqui());
                      setState(() {});
                    }),
                RadioListTile(
                    contentPadding: EdgeInsets.all(2),
                    value: 3,
                    groupValue: gender,
                    title: const Text("Asistente"),
                    onChanged: (int? value) {
                      gender = value!;
                      print(jerarqui());
                      setState(() {});
                    }),
                SizedBox(
                  width: double.infinity,
                  height: 45,
                  child: ElevatedButton.icon(
                    onPressed: () {
                      guardarEvaluador();
                    },
                    icon: const Icon(Icons.save),
                    label: const Text("Guardar"),
                    style: ElevatedButton.styleFrom(
                        primary: dcolorButon2,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(14))),
                  ),
                ),
                const SizedBox(
                  height: 12,
                ),
                SizedBox(
                  width: double.infinity,
                  height: 45,
                  child: ElevatedButton.icon(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: const Icon(Icons.cancel),
                    label: const Text("Cancelar"),
                    style: ElevatedButton.styleFrom(
                        primary: Colors.redAccent,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(14))),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
