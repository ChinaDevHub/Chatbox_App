import 'package:flutter/material.dart';

class CustomIcon extends StatelessWidget {
  const CustomIcon({
    super.key,
    required this.icon,
    required this.onPressed,
    this.iconSize = 25,
    this.toolTip,
    this.iconColor = Colors.black,
  });

  final Icon icon;
  final void Function()? onPressed;
  final double iconSize;
  final String? toolTip;
  final Color? iconColor;
  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: onPressed,
      icon: icon,
      iconSize: iconSize,
      tooltip: toolTip,
      color: iconColor,
    );
  }
}
