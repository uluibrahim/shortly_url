import 'package:flutter/material.dart';

class CustomSnackBar extends SnackBar {
  final String text;
  final bool? isError;

  CustomSnackBar({Key? key, this.isError = true, required this.text})
      : super(
          key: key,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(30),
              topRight: Radius.circular(30),
            ),
          ),
          content: Text(text, textAlign: TextAlign.center),
          backgroundColor: isError! ? Colors.red : null,
          duration: const Duration(seconds: 1),
        );
}
