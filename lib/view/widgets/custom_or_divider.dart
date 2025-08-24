import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_mentor/view/widgets/custom_divider.dart';
import 'package:my_mentor/view/widgets/custom_text.dart';
import 'package:my_mentor/utils/constants/app_color.dart';
import 'package:my_mentor/utils/constants/app_sizes.dart';
import 'package:my_mentor/utils/constants/app_text.dart';

class CustomOrDivider extends StatelessWidget {
  const CustomOrDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        AppSizes.s10.horizontalSpace,
        CustomDivider(
          indent: AppSizes.s20,
          endIndent: AppSizes.s10,
          divColor: AppColor.white,
          thickness: AppSizes.s2,
        ),
        CustomText(
          text: AppText.or,
          color: AppColor.white70,
          fontSize: AppSizes.s20,
        ),
        CustomDivider(
          indent: AppSizes.s10,
          endIndent: AppSizes.s20,
          divColor: AppColor.white,
          thickness: AppSizes.s2,
        ),
      ],
    );
  }
}
