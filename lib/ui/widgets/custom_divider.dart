import 'package:flutter/material.dart';

class CustomDivider extends StatelessWidget {
  CustomDivider({
    super.key,
    this.indent = 0,
    this.endIndent = 0,
    required this.divColor,
    required this.thickness,
  });

  final double indent;
  final double endIndent;
  final Color divColor;
  final double thickness;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Divider(
        color: divColor,
        thickness: thickness,
        radius: BorderRadius.circular(10),
        endIndent: endIndent,
        indent: indent,
      ),
    );
  }
}
