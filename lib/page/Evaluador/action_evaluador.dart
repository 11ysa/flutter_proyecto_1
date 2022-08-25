// ignore_for_file: prefer_const_constructors

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_proyecto_1/models/Evaluador.dart';

class ActionEvaluador extends StatelessWidget {
  EvaluadorModel? model;
  ActionEvaluador({this.model});

  TextEditingController ControllerTexto = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
        title: TextFormField(
      initialValue: model!.nombre,
      //controller: ControllerTexto
    ));
  }
}
