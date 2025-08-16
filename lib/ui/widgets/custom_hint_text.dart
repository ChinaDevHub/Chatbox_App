import 'package:flutter/material.dart';
import 'package:my_mentor/ui/widgets/custom_text.dart';
import 'package:my_mentor/utils/constants/app_color.dart';
import 'package:my_mentor/utils/constants/app_padding.dart';
import 'package:my_mentor/utils/constants/app_sizes.dart';

class CustomHintText extends StatelessWidget {
  const CustomHintText({super.key, required this.text});
  final String text;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: AppPadding.h20,
      child: CustomText(
        text: text,
        color: AppColor.teal,
        fontSize: AppSizes.s18,
      ),
    );
  }
}
