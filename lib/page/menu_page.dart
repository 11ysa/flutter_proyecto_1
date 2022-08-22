import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_proyecto_1/page/my_drawe.dart';
import 'package:flutter_proyecto_1/ui/generales/colors.dart';

class MenuPage extends StatelessWidget {
  const MenuPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Convocatorias"),
        backgroundColor: dcolorAppBar,
        centerTitle: true,
      ),
      drawer: MyDrawe(),
    );
  }
}
