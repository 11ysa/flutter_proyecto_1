import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_proyecto_1/ui/generales/colors.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ItemsParticipante extends StatelessWidget {
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
              color: dcolorBordeItems,
              blurRadius: 12,
              offset: const Offset(4, 4),
            )
          ]),
      child: Column(
        children: [
          Row(
            children: [
              SvgPicture.asset('assets/icons/user.svg',
                  height: 16.0, color: dColorFontPrimary),
              const SizedBox(
                width: 4.0,
              ),
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
                    "Juan Sanchez Alarcon",
                    style: TextStyle(
                      fontSize: 14.0,
                      color: dColorFontPrimary.withOpacity(0.7),
                    ),
                  )
                ],
              ),
            ],
          ),
          SizedBox(
            height: 10.0,
          ),
          Row(
            children: [
              SvgPicture.asset('assets/icons/id-card.svg',
                  height: 16.0, color: dColorFontPrimary),
              const SizedBox(
                width: 4.0,
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
                        "75197145",
                        style: TextStyle(
                          fontSize: 13.0,
                          color: dColorFontPrimary.withOpacity(0.7),
                        ),
                      )
                    ],
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Edad:",
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 14.0,
                          color: dColorFontPrimary.withOpacity(0.7),
                        ),
                      ),
                      Text(
                        "25",
                        style: TextStyle(
                          fontSize: 14.0,
                          color: dColorFontPrimary.withOpacity(0.7),
                        ),
                      )
                    ],
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Especialidad:",
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 14.0,
                          color: dColorFontPrimary.withOpacity(0.7),
                        ),
                      ),
                      Text(
                        "Analista",
                        style: TextStyle(
                          fontSize: 14.0,
                          color: dColorFontPrimary.withOpacity(0.7),
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
