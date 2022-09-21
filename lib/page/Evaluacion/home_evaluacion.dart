import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_proyecto_1/page/Evaluacion/list_convocatorias.dart';
import 'package:path/path.dart';

import '../../db/db_admin.dart';

class HomeEvaluacion extends StatelessWidget {
  const HomeEvaluacion({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          child: Row(
            children: [
              ElevatedButton(
                  onPressed: () {},
                  child: Text("convocatorias Segun Evaluador"))
            ],
          ),
        ),
      ),
    );
  }
}
