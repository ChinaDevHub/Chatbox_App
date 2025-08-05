import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomTextEdit {
  static NORMAL_TEXT_STYLE({
    required Color color,
    required double fontSize,
    FontWeight fontWeight = FontWeight.w500,
  }) {
    return GoogleFonts.montserrat(
      color: color,
      fontSize: fontSize,
      fontWeight: fontWeight,
    );
  }
}
