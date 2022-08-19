import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_proyecto_1/ui/generales/colors.dart';
import 'package:flutter_svg/flutter_svg.dart';

class TextFieldNormalWidget extends StatelessWidget {
  String hintText;
  String icon;
  bool isDNI;
  TextEditingController controller;

  TextFieldNormalWidget({
    required this.hintText,
    required this.icon,
    required this.isDNI,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8.0),
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
              color: Colors.black.withOpacity(0.05),
              offset: const Offset(4, 4),
              blurRadius: 12.0),
        ],
      ),
      child: TextField(
        controller: controller,
        keyboardType: isDNI ? TextInputType.number : null,
        maxLength: isDNI ? 8 : null,
        style: TextStyle(
          fontSize: 14.0,
          color: dColorFontPrimary.withOpacity(0.9),
        ),
        inputFormatters: isDNI
            ? [
                FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
              ]
            : [],
        decoration: InputDecoration(
          counterText: "",
          filled: true,
          fillColor: Colors.white,
          hintText: hintText,
          hintStyle: TextStyle(
            fontSize: 14.0,
            color: dColorFontPrimary.withOpacity(0.45),
          ),
          prefixIcon: SvgPicture.asset(
            'assets/icons/$icon.svg',
            fit: BoxFit.scaleDown,
            color: dColorFontPrimary.withOpacity(0.45),
          ),
          contentPadding: const EdgeInsets.symmetric(
            vertical: 18.0,
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(14.0),
            borderSide: BorderSide.none,
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(14.0),
            borderSide: BorderSide.none,
          ),
        ),
      ),
    );
  }
}
