import 'package:flutter/material.dart';
import 'package:my_mentor/view/widgets/custom_text.dart';
import 'package:my_mentor/utils/constants/app_color.dart';
import 'package:my_mentor/utils/constants/app_radius.dart';
import 'package:my_mentor/utils/constants/app_sizes.dart';
import 'package:my_mentor/utils/constants/app_text_fontweight.dart';

class CustomDecoratedBox extends StatelessWidget {
  const CustomDecoratedBox({
    super.key,
    required this.containerColor,
    required this.textColor,
    required this.text,
  });

  final Color containerColor;
  final Color textColor;
  final String text;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: AppSizes.s50,
      width: MediaQuery.of(context).size.width * 0.8,
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: containerColor,
          borderRadius: AppRadius.all20,
          border: Border.all(color: AppColor.greyShade400),
        ),
        child: Center(
          child: CustomText(
            text: text,
            color: textColor,
            fontSize: AppSizes.s20,
            fontWeight: AppTextFontWeight.bold,
          ),
        ),
      ),
    );
  }
}
