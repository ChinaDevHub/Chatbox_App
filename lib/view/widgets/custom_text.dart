import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

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
    return Text(
      text,
      style: GoogleFonts.montserrat(
        color: color,
        fontSize: fontSize,
        fontWeight: fontWeight,
      ),
    );
  }
}
