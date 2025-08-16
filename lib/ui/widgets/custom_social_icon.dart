import 'package:flutter/material.dart';
import 'package:my_mentor/utils/constants/app_color.dart';
import 'package:my_mentor/utils/constants/app_padding.dart';
import 'package:my_mentor/utils/constants/app_sizes.dart';

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
      padding: AppPadding.all10,
      child: DecoratedBox(
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: AppColor.transparent,
          border: Border.all(color: iconEdgeColor),
        ),
        child: Image.asset(path, width: AppSizes.s50, height: AppSizes.s50),
      ),
    );
  }
}
