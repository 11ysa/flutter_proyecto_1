import 'package:flutter/material.dart';
import 'package:flutter_proyecto_1/db/db_admin.dart';
import 'package:flutter_proyecto_1/models/participante.dart';
import 'package:flutter_proyecto_1/ui/generales/colors.dart';
import 'package:flutter_proyecto_1/ui/generales/textfield_normal_widget.dart';

class FormParticipante extends StatefulWidget {
  ParticipanteModel? modelPartici;

  FormParticipante({this.modelPartici});

  @override
  State<FormParticipante> createState() => _FormParticipanteState();
}

class _FormParticipanteState extends State<FormParticipante> {
  /*Variables */
  final _formkey = GlobalKey<FormState>();
  final TextEditingController _nombreController = TextEditingController();
  final TextEditingController _apellidosController = TextEditingController();
  final TextEditingController _dni = TextEditingController();
  final TextEditingController _especialdad = TextEditingController();
  final TextEditingController _edad = TextEditingController();

  /* Procedimientos */
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    if (widget.modelPartici != null) {
      _nombreController.text = widget.modelPartici!.nombre;
      _apellidosController.text = widget.modelPartici!.apellidos;
      _dni.text = widget.modelPartici!.dni;
      _especialdad.text = widget.modelPartici!.especialidad;
      _edad.text = widget.modelPartici!.edad.toString();
    }
  }

  //insertar nuevo participante
  GuradarParticpante() {
    if (_formkey.currentState!.validate()) {
      ParticipanteModel model = ParticipanteModel(
          nombre: _nombreController.text,
          apellidos: _apellidosController.text,
          dni: _dni.text,
          edad: int.parse(_edad.text),
          especialidad: _especialdad.text);
      if (widget.modelPartici == null) {
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
                    Text("Participante Registrado con exito")
                  ],
                )));
          }
        });
      } else {
        model.id = widget.modelPartici!.id;
        DBAdmin.db.updateParticipante(model).then((value) {
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
                    Text("Participante Modificado con exito")
                  ],
                )));
          }
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
      content: Form(
        key: _formkey,
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text("Nuevo Participante"),
              Divider(height: 10),
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
                  hintText: "Edad",
                  icon: "bx-ege",
                  isDNI: false,
                  controller: _edad,
                  campoNumerico: true),
              const SizedBox(
                height: 12,
              ),
              TextFieldNormalWidget(
                  hintText: "Especialidad",
                  icon: "user-badge",
                  isDNI: false,
                  controller: _especialdad,
                  campoNumerico: false),
              const SizedBox(
                height: 12,
              ),
              SizedBox(
                width: double.infinity,
                height: 45,
                child: ElevatedButton.icon(
                  onPressed: () {
                    GuradarParticpante();
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
