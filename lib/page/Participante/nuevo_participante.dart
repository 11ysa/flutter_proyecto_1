import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_proyecto_1/page/Participante/widget.dart';

import '../../ui/generales/textfield_normal_widget.dart';

class NuevoParticipante extends StatelessWidget {
  final TextEditingController _nombreController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarParticipante,
      body: Column(
        children: [
          TextFieldNormalWidget(
            hintText: "Nombres",
            icon: 'user',
            isDNI: false,
            controller: _nombreController,
          ),
        ],
      ),
    );
  }
}
