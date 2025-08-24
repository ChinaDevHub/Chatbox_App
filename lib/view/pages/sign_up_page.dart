import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_mentor/controllers/login_controller.dart';
import 'package:my_mentor/view/pages/home_page.dart';
import 'package:my_mentor/view/widgets/custom_decorated_box.dart';
import 'package:my_mentor/view/widgets/custom_hint_text.dart';
import 'package:my_mentor/view/widgets/custom_text.dart';
import 'package:my_mentor/view/widgets/custom_input.dart';
import 'package:my_mentor/utils/constants/app_color.dart';
import 'package:my_mentor/utils/constants/app_duration.dart';
import 'package:my_mentor/utils/constants/app_icon.dart';
import 'package:my_mentor/utils/constants/app_padding.dart';
import 'package:my_mentor/utils/constants/app_scroll_direction.dart';
import 'package:my_mentor/utils/constants/app_sizes.dart';
import 'package:my_mentor/utils/constants/app_text.dart';
import 'package:my_mentor/utils/constants/app_text_fontweight.dart';
import 'package:my_mentor/utils/helpers/go.dart';
import 'package:provider/provider.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({super.key});

  @override
  Widget build(BuildContext context) {
    final read = context.read<LoginController>();
    final watch = context.watch<LoginController>();
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
        backgroundColor: AppColor.white,
      ),
      backgroundColor: AppColor.white,
      body: SafeArea(
        child: SingleChildScrollView(
          scrollDirection: AppScrollDirection.v,
          physics: BouncingScrollPhysics(),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              AppSizes.s40.verticalSpace,
              Center(
                child: CustomText(
                  text: AppText.signUpEmail,
                  color: AppColor.black,
                  fontSize: AppSizes.s25,
                  fontWeight: AppTextFontWeight.bold,
                ),
              ),
              Padding(
                padding: AppPadding.all30,
                child: CustomText(
                  text: AppText.signUpDesc,
                  color: AppColor.greyShade500,
                  fontSize: AppSizes.s18,
                ),
              ),
              AppSizes.s15.verticalSpace,
              Form(
                key: watch.formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomHintText(text: AppText.yourName),
                    CustomInput(
                      ct: watch.getName,
                      checkForm:
                          (p0) => context.read<LoginController>().checkFormSU(),
                      validator: watch.validateName,
                    ),
                    AppSizes.s30.verticalSpace,
                    CustomHintText(text: AppText.yourEmail),
                    CustomInput(
                      ct: watch.getEmail,
                      checkForm:
                          (p0) => context.read<LoginController>().checkFormSU(),
                      validator: watch.validateEmail,
                    ),
                    AppSizes.s30.verticalSpace,
                    CustomHintText(text: AppText.password),
                    CustomInput(
                      ct: watch.getPassword,
                      checkForm:
                          (p0) => context.read<LoginController>().checkFormSU(),
                      validator: watch.validatePassword,
                      obscureText: !watch.isVisible,
                      sufficIcon: IconButton(
                        icon: Icon(
                          watch.isVisible
                              ? AppIcon.visibility
                              : AppIcon.visibilityOff,
                          color: AppColor.redShade900,
                        ),
                        onPressed: () {
                          context.read<LoginController>().toggleVisibility();
                        },
                      ),
                    ),
                    AppSizes.s30.verticalSpace,
                    CustomHintText(text: AppText.confirmPassword),
                    CustomInput(
                      ct: watch.getConfirmPassword,
                      checkForm:
                          (p0) => context.read<LoginController>().checkFormSU(),
                      validator: watch.validateConfirmPassword,
                    ),
                  ],
                ),
              ),
              AppSizes.s140.verticalSpace,
              InkWell(
                onTap: () {
                  final valid = watch.formKey.currentState?.validate() ?? false;
                  if (valid) {
                    read.isFilledSU();
                    Go.to(context, HomePage());
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        backgroundColor: AppColor.redAccent,
                        duration: AppDuration.second1,
                        content: CustomText(
                          text: AppText.pleaseFill,
                          color: AppColor.white,
                          fontSize: AppSizes.s20,
                          fontWeight: AppTextFontWeight.bold,
                        ),
                      ),
                    );
                  }
                },
                child:
                    watch.isDisable
                        ? CustomDecoratedBox(
                          containerColor: AppColor.teal,
                          textColor: AppColor.white,
                          text: AppText.createAccount,
                        )
                        : CustomDecoratedBox(
                          containerColor: AppColor.greyShade300,
                          textColor: AppColor.greyShade700,
                          text: AppText.createAccount,
                        ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
