import 'package:flutter/material.dart';
import 'package:shortly_url/core/extensions/context_extension.dart';

class CustomElevatedButton extends ElevatedButton {
  final String text;
  final VoidCallback ontap;
  final BuildContext context;
  CustomElevatedButton({
    super.key,
    required this.ontap,
    required this.text,
    required this.context,
  }) : super(
          style: ButtonStyle(
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
