import 'package:flutter/material.dart';
import 'package:shortly_url/core/extensions/context_extension.dart';

class CustomElevatedButton extends ElevatedButton {
  final String text;
  final VoidCallback ontap;
  final BuildContext context;
  final Color? color;
  CustomElevatedButton({
    super.key,
    required this.ontap,
    required this.text,
    required this.context,
    this.color,
  }) : super(
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(color),
            minimumSize:
                MaterialStateProperty.all(Size(context.width * 0.85, 40)),
            shape: MaterialStateProperty.all(
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            ),
          ),
          child: Text(text),
          onPressed: ontap,
        );
}
