// ignore_for_file: prefer_const_constructors

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_proyecto_1/models/Evaluador.dart';

class UpdateEvaluador extends StatelessWidget {
  EvaluadorModel model;
  UpdateEvaluador({required this.model});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
        title: TextFormField(
      initialValue: model.dni,
    ));
  }
}
