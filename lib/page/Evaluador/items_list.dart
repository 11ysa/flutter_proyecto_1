// ignore_for_file: prefer_const_constructors

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_proyecto_1/models/Evaluador.dart';
import 'package:flutter_proyecto_1/page/Evaluador/update_evaluador.dart';
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
      margin: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
      padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
      decoration: BoxDecoration(
          color: dcolorFondoItems,
          borderRadius: BorderRadius.circular(14),
          boxShadow: [
            BoxShadow(
                blurRadius: 12,
                offset: const Offset(4, 4),
                color: dcolorBordeItems)
          ]),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [
              Row(
                children: [
                  Row(
                    children: [
                      Column(
                        children: [
                          SvgPicture.asset('assets/icons/user.svg',
                              height: 20.0, color: dColorFontPrimary),
                        ],
                      ),
                      const SizedBox(
                        width: 10.0,
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Nombre completo:",
                                style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 14.0,
                                  color: dColorFontPrimary.withOpacity(0.7),
                                ),
                              ),
                              Text(
                                modelEvalu.nombreCompleto(),
                                style: TextStyle(
                                  fontSize: 14.0,
                                  color: dColorFontPrimary.withOpacity(0.7),
                                ),
                              )
                            ],
                          ),
                          const SizedBox(width: 5),
                          Jerarquia()
                        ],
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  Column(
                    children: [
                      SvgPicture.asset('assets/icons/id-card.svg',
                          height: 20.0, color: dColorFontPrimary),
                      const SizedBox(
                        width: 4.0,
                      )
                    ],
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Row(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "DNI:",
                            style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 12.0,
                              color: dColorFontPrimary.withOpacity(0.7),
                            ),
                          ),
                          Text(
                            modelEvalu.dni,
                            style: TextStyle(
                              fontSize: 13.0,
                              color: dColorFontPrimary.withOpacity(0.7),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                  SizedBox(
                    width: 60,
                  ),
                  Row(
                    children: [
                      Column(
                        children: [
                          SvgPicture.asset('assets/icons/user-badge.svg',
                              height: 20.0, color: dColorFontPrimary),
                          const SizedBox(
                            width: 4.0,
                          )
                        ],
                      ),
                      const SizedBox(
                        width: 10.0,
                      ),
                      Row(
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "JERARQUIA:",
                                style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 12.0,
                                  color: dColorFontPrimary.withOpacity(0.7),
                                ),
                              ),
                              Text(
                                modelEvalu.jerarquia,
                                style: TextStyle(
                                  fontSize: 13.0,
                                  color: dColorFontPrimary.withOpacity(0.7),
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    ],
                  )
                ],
              ),
            ],
          ),
          Container(
              child: Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              IconButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                UpdateEvaluador(model: modelEvalu)));
                  },
                  icon: Icon(Icons.edit))
            ],
          ))
        ],
      ),
    );
  }
}
