import 'package:flutter/material.dart';
import 'package:my_mentor/utils/constants/app_radius.dart';

class CustomDivider extends StatelessWidget {
  const CustomDivider({
    super.key,
    this.indent = 0,
    this.endIndent = 0,
    required this.divColor,
    required this.thickness,
    this.radius= AppRadius.all10,
    this.height=0,
  });

  final double indent;
  final double endIndent;
  final Color divColor;
  final double thickness;
  final BorderRadius radius;
  final double height;
  @override
  Widget build(BuildContext context) {
    return Divider(
      height: height,
      color: divColor,
      thickness: thickness,
      radius: radius,
      endIndent: endIndent,
      indent: indent,
    );
  }
}
