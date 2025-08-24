import 'package:flutter/material.dart';
import 'package:my_mentor/utils/constants/app_color.dart';

class CustomIcon extends StatelessWidget {
  const CustomIcon({
    super.key,
    required this.icon,
    required this.onPressed,
    this.iconSize = 25,
    this.toolTip,
    this.iconColor = AppColor.black,
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
