import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_proyecto_1/ui/generales/colors.dart';

import '../../ui/generales/textfield_normal_widget.dart';

class formNuevoEvaluador extends StatefulWidget {
  const formNuevoEvaluador({Key? key}) : super(key: key);

  @override
  State<formNuevoEvaluador> createState() => _formNuevoJuradoState();
}

class _formNuevoJuradoState extends State<formNuevoEvaluador> {
  final _formkey = GlobalKey<FormState>();
  int gender = 1;
  final TextEditingController _nombreController = TextEditingController();
  final TextEditingController _apellidosController = TextEditingController();
  final TextEditingController _dni = TextEditingController();
  final TextEditingController _area = TextEditingController();
  final TextEditingController _jeraquia = TextEditingController();
  final TextEditingController _clave = TextEditingController();

  //insertar nuevo participante
  registrarEvaluador() {
    /*  if (_formkey.currentState!.validate()) {
      ParticipanteModel model = ParticipanteModel(
          nombre: _nombreController.text,
          apellidos: _apellidosController.text,
          dni: _dni.text,
          edad: int.parse(_edad.text),
          especialidad: _especialdad.text);

      DBAdmin.db.insertParticipante(model).then((value) {
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
                  Text("Participante registrado con exito")
                ],
              )));
        }
      }
      );
    }*/
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text("Nuevo Evaluador"),
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
              const SizedBox(height: 12.0),
              TextFieldNormalWidget(
                  hintText: "Apellidos",
                  icon: "user",
                  isDNI: false,
                  controller: _apellidosController,
                  campoNumerico: false),
              const SizedBox(height: 12.0),
              TextFieldNormalWidget(
                  hintText: "DNI",
                  icon: "id-card",
                  isDNI: true,
                  controller: _dni,
                  campoNumerico: true),
              const SizedBox(
                height: 12,
              ),
              TextFieldNormalWidget(
                  hintText: "Area Trabajo",
                  icon: "bx-ege",
                  isDNI: false,
                  controller: _area,
                  campoNumerico: false),
              TextFieldNormalWidget(
                  hintText: "Clave de Acceso",
                  icon: "bx-ege",
                  isDNI: false,
                  controller: _clave,
                  campoNumerico: false),
              const SizedBox(
                height: 12,
              ),
              RadioListTile(
                  value: 1,
                  groupValue: gender,
                  title: const Text("Jefe"),
                  onChanged: (int? value) {
                    gender = value!;
                    setState(() {});
                  }),
              RadioListTile(
                  value: 0,
                  groupValue: gender,
                  title: const Text("Colaborador"),
                  onChanged: (int? value) {
                    gender = value!;
                    setState(() {});
                  }),
              RadioListTile(
                  value: 0,
                  groupValue: gender,
                  title: const Text("Asistente"),
                  onChanged: (int? value) {
                    gender = value!;
                    setState(() {});
                  }),
              SizedBox(
                width: double.infinity,
                height: 45,
                child: ElevatedButton.icon(
                  onPressed: () {
                    registrarEvaluador();
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
    );
  }
}
