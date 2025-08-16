import 'package:flutter/material.dart';

class CustomText extends StatelessWidget {
  const CustomText({
    super.key,
    required this.text,
    required this.color,
    required this.fontSize,
    this.fontWeight = FontWeight.w500,
    //this.textAlign = TextAlign.center,
  });

  final String text;
  final Color color;
  final double fontSize;
  final FontWeight fontWeight;
  //final TextAlign textAlign;
  @override
  Widget build(BuildContext context) {
    return CustomText(
      text: text,
      color: color,
      fontSize: fontSize,
      fontWeight: fontWeight,
    );
  }
}
