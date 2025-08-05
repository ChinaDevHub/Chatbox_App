import 'package:flutter/material.dart';

class CustomSocialIcon extends StatelessWidget {
  CustomSocialIcon({
    super.key,
    required this.path,
    required this.icon_edge_color,
  });
  final String path;
  final Color icon_edge_color;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: DecoratedBox(
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.transparent,
          border: Border.all(color: icon_edge_color),
        ),
        child: Image.asset(path, width: 50, height: 50),
      ),
    );
  }
}
