import 'package:bookly_app_clean/Core/utils/styles.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton(
      {super.key,
      required this.backgroundColor,
      required this.textColor,
        this.borderRadius, required this.text,  this.fontSize, this.onPressed});
  final String text;
  final double? fontSize;
  final Color backgroundColor;
  final Color textColor;
  final BorderRadius? borderRadius;
  final void Function()? onPressed;

@override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 56,
      child: TextButton(
          onPressed:onPressed,
          style: TextButton.styleFrom(
            backgroundColor: backgroundColor,
            shape:
                RoundedRectangleBorder(borderRadius:borderRadius ?? BorderRadius.circular(22)),
          ),
          child: Text(
            text,
            style: Styles.textStyle20.copyWith(
                color: textColor,
                fontWeight: FontWeight.bold,
              fontSize: fontSize
            ),
          )),
    );
  }
}
