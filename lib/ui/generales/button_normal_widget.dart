import 'package:flutter/material.dart';
import 'package:flutter_proyecto_1/ui/generales/colors.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ButtonNormalWidget extends StatelessWidget {
  String text;
  String icon;
  Function? onPressed;

  ButtonNormalWidget({
    required this.text,
    required this.icon,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 52.0,
      child: ElevatedButton.icon(
        onPressed: onPressed != null
            ? () {
                onPressed!();
              }
            : null,
        style: ElevatedButton.styleFrom(
          primary: dcolorButon2,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(14.0),
          ),
        ),
        icon: SvgPicture.asset(
          'assets/icons/$icon.svg',
          color: onPressed != null ? Colors.white : Colors.black38,
        ),
        label: Text(
          text,
          style: const TextStyle(
            fontSize: 16.0,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }
}
