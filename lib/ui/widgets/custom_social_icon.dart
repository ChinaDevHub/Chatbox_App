import 'package:flutter/material.dart';

class CustomSocialIcon extends StatelessWidget {
  const CustomSocialIcon({
    super.key,
    required this.path,
    required this.iconEdgeColor,
  });
  final String path;
  final Color iconEdgeColor;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: DecoratedBox(
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.transparent,
          border: Border.all(color: iconEdgeColor),
        ),
        child: Image.asset(path, width: 50, height: 50),
      ),
    );
  }
}
