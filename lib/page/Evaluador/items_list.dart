import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_proyecto_1/models/Evaluador.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_proyecto_1/ui/generales/colors.dart';

import '../../ui/generales/colors.dart';

class ItemsEvaluador extends StatelessWidget {
  EvaluadorModel modelEvalu;

  ItemsEvaluador({required this.modelEvalu});

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
      child: Column(
        children: [
          Row(
            children: [
              Column(
                children: [
                  SvgPicture.asset('assets/icons/user.svg',
                      height: 16.0, color: dColorFontPrimary),
                ],
              ),
              const SizedBox(
                width: 10.0,
              ),
              Row(
                children: [
                  Column(
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
                  )
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
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SvgPicture.asset('assets/icons/id-card.svg',
                      height: 16.0, color: dColorFontPrimary),
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
                width: 100,
              ),
              Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
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
          SizedBox(
            height: 10,
          ),
          Row(
            children: [
              Icon(
                Icons.star_border_outlined,
                color: Colors.blueAccent,
              ),
              Icon(
                Icons.star_border_outlined,
                color: Colors.blueAccent,
              )
            ],
          )
        ],
      ),
    );
  }
}
