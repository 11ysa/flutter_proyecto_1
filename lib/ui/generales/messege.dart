import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

SizedBox divider10Width = const SizedBox(
  width: 10,
);

showSnackBarError(BuildContext context, String text) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      backgroundColor: Colors.redAccent,
      behavior: SnackBarBehavior.floating,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(14.0),
      ),
      content: Row(
        children: [
          const Icon(
            Icons.error_outline,
            color: Colors.white,
          ),
          divider10Width,
          Expanded(
            child: Text(
              text,
            ),
          ),
        ],
      ),
    ),
  );
}
