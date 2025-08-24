import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:my_mentor/view/widgets/custom_text.dart';
import 'package:my_mentor/utils/constants/app_color.dart';
import 'package:my_mentor/utils/constants/app_sizes.dart';
import 'package:my_mentor/utils/constants/app_text.dart';
import 'package:my_mentor/utils/constants/app_text_fontweight.dart';

class CustomForgetPassword extends StatelessWidget {
  const CustomForgetPassword({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => log(AppText.forgetClicked),
      child: Center(
        child: CustomText(
          text: AppText.forgotPassword,
          color: AppColor.teal,
          fontSize: AppSizes.s18,
          fontWeight: AppTextFontWeight.bold,
        ),
      ),
    );
  }
}
