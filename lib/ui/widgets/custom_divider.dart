import 'package:flutter/material.dart';
import 'package:my_mentor/utils/constants/app_radius.dart';

class CustomDivider extends StatelessWidget {
  const CustomDivider({
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
        radius: AppRadius.all10,
        endIndent: endIndent,
        indent: indent,
      ),
    );
  }
}
