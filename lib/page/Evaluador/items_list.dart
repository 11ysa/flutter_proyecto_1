// ignore_for_file: prefer_const_constructors

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_proyecto_1/models/Evaluador.dart';

import 'package:flutter_proyecto_1/page/Participante/update_participante.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_proyecto_1/ui/generales/colors.dart';

import '../../ui/generales/colors.dart';

class ItemsEvaluador extends StatelessWidget {
  EvaluadorModel modelEvalu;

  ItemsEvaluador({required this.modelEvalu});

  Widget Jerarquia() {
    Widget fila;
    switch (modelEvalu.jerarquia) {
      case "1":
        fila = Row(
          // ignore: prefer_const_literals_to_create_immutables
          children: [
            Icon(
              Icons.star_border_outlined,
              size: 14,
              color: Color.fromARGB(255, 16, 179, 65),
            ),
          ],
        );
        break;
      case "2":
        fila = Row(
          // ignore: prefer_const_literals_to_create_immutables
          children: [
            Icon(
              Icons.star_border_outlined,
              size: 14,
              color: Color.fromARGB(255, 16, 179, 65),
            ),
            Icon(
              Icons.star_border_outlined,
              size: 14,
              color: Color.fromARGB(255, 16, 179, 65),
            ),
          ],
        );
        break;

      default:
        fila = Row(
          // ignore: prefer_const_literals_to_create_immutables
          children: [
            Icon(
              Icons.star_border_outlined,
              size: 14,
              color: Color.fromARGB(255, 16, 179, 65),
            ),
            Icon(
              Icons.star_border_outlined,
              size: 14,
              color: Color.fromARGB(255, 16, 179, 65),
            ),
            Icon(
              Icons.star_border_outlined,
              size: 14,
              color: Color.fromARGB(255, 16, 179, 65),
            ),
          ],
        );
    }
    return fila;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 2.0, vertical: 2.0),
      padding: const EdgeInsets.symmetric(horizontal: 2, vertical: 2),
      decoration: BoxDecoration(
          color: dcolorFondoItems,
          borderRadius: BorderRadius.circular(14),
          boxShadow: [
            BoxShadow(
                blurRadius: 12,
                offset: const Offset(4, 4),
                color: dcolorBordeItems)
          ]),
      child: ListTile(
          leading: CircleAvatar(
            child: Text("A"),
          ),
          title: Text(
            modelEvalu.nombreCompleto(),
            maxLines: 1,
            style: TextStyle(
              fontSize: 15.0,
              color: dColorFontPrimary.withOpacity(0.7),
            ),
          ),
          subtitle: Column(
            children: [
              Row(
                children: [
                  SvgPicture.asset('assets/icons/id-card.svg',
                      height: 15.0, color: dColorFontPrimary),
                  const SizedBox(
                    width: 2,
                  ),
                  Text(
                    modelEvalu.dni,
                    style: TextStyle(
                      fontSize: 12.0,
                      color: dColorFontPrimary.withOpacity(0.7),
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  SvgPicture.asset('assets/icons/user-badge.svg',
                      height: 15.0, color: dColorFontPrimary),
                  Text(
                    modelEvalu.jerarquia,
                    style: TextStyle(
                      fontSize: 12.0,
                      color: dColorFontPrimary.withOpacity(0.7),
                    ),
                  ),
                ],
              ),
              Jerarquia()
            ],
          ),
          trailing: IconButton(onPressed: () {}, icon: Icon(Icons.edit))),
    );
  }
}
