import 'dart:ui';

import 'package:flutter/material.dart';

Color dcolorAppBar = Color(0xff363f93);
Color dcolorFondo = Colors.indigoAccent.withOpacity(0.5);
Color dcolorFondo2 = Color(0xff363f93);

Color dcolorButon1 = Color(0xff03a5cb);
Color dcolorButon2 = Colors.indigoAccent;

Color dcolorBordeItems = Colors.white;
Color dcolorFondoItems = Colors.black.withOpacity(0.05);

Color dcolorTitulo = const Color(0xff21293A).withOpacity(0.85);

Color dColorFontPrimary = Colors.black;
Color dColorBrandPrimary = const Color(0xff7248E5);

Widget JeraquiaStar = Row(
  children: [
    Icon(
      Icons.star,
      size: 14,
      color: Colors.amber[700],
    ),
    Icon(
      Icons.star,
      size: 14,
      color: Colors.amber[700],
    ),
  ],
);
