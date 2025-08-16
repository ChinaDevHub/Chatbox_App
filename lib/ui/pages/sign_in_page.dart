import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_mentor/controllers/login_controller.dart';
import 'package:my_mentor/ui/pages/home_page.dart';
import 'package:my_mentor/ui/widgets/custom_decorated_box.dart';
import 'package:my_mentor/ui/widgets/custom_forget_password.dart';
import 'package:my_mentor/ui/widgets/custom_hint_text.dart';
import 'package:my_mentor/ui/widgets/custom_or_divider.dart';
import 'package:my_mentor/ui/widgets/custom_social_icon.dart';
import 'package:my_mentor/ui/widgets/custom_text.dart';
import 'package:my_mentor/ui/widgets/custom_input.dart';
import 'package:my_mentor/utils/constants/app_color.dart';
import 'package:my_mentor/utils/constants/app_duration.dart';
import 'package:my_mentor/utils/constants/app_icon.dart';
import 'package:my_mentor/utils/constants/app_image.dart';
import 'package:my_mentor/utils/constants/app_padding.dart';
import 'package:my_mentor/utils/constants/app_scroll_direction.dart';
import 'package:my_mentor/utils/constants/app_sizes.dart';
import 'package:my_mentor/utils/constants/app_text.dart';
import 'package:my_mentor/utils/constants/app_text_fontweight.dart';
import 'package:my_mentor/utils/helpers/go.dart';
import 'package:provider/provider.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({super.key});

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  @override
  Widget build(BuildContext context) {
    final watch = context.watch<LoginController>();
    final read = context.read<LoginController>();
    return Scaffold(
      backgroundColor: AppColor.white,
      appBar: AppBar(
        backgroundColor: AppColor.white,
        leading: IconButton(
          onPressed: () {
            read.clearFields();
            Go.pop(context);
          },
          icon: Icon(AppIcon.arrowBackIos, size: AppSizes.s25),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          scrollDirection: AppScrollDirection.v,
          physics: BouncingScrollPhysics(),
          child: Form(
            key: watch.formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                AppSizes.s40.verticalSpace,
                Center(
                  child: CustomText(
                    text: AppText.loginToChatBox,
                    color: AppColor.black,
                    fontSize: AppSizes.s25,
                    fontWeight: AppTextFontWeight.bold,
                  ),
                ),
                AppSizes.s15.verticalSpace,
                Padding(
                  padding: AppPadding.all45,
                  child: CustomText(
                    text: AppText.welcomeBack,
                    color: AppColor.greyShade500,
                    fontSize: AppSizes.s18,
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CustomSocialIcon(
                      path: AppImage.socialIconFB,
                      iconEdgeColor: AppColor.black,
                    ),
                    AppSizes.s20.horizontalSpace,
                    CustomSocialIcon(
                      path: AppImage.socialIconGoogle,
                      iconEdgeColor: AppColor.black,
                    ),
                    AppSizes.s20.horizontalSpace,
                    CustomSocialIcon(
                      path: AppImage.socialIconIos,
                      iconEdgeColor: AppColor.black,
                    ),
                  ],
                ),
                AppSizes.s20.verticalSpace,
                CustomOrDivider(),
                AppSizes.s20.verticalSpace,
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomHintText(text: AppText.yourEmail),
                    CustomInput(
                      ct: watch.getEmail,
                      checkForm: (p0) => read.checkFormSI(),
                      validator: watch.validateEmail,
                    ),
                    AppSizes.s20.verticalSpace,
                    CustomHintText(text: AppText.yourPassword),
                    CustomInput(
                      ct: watch.getPassword,
                      checkForm: (p0) => read.checkFormSI(),
                      validator: watch.validatePassword,
                      obscureText: !watch.isVisible,
                      sufficIcon: IconButton(
                        onPressed: () {
                          read.toggleVisibility();
                        },
                        icon: Icon(
                          watch.isVisible
                              ? AppIcon.visibility
                              : AppIcon.visibilityOff,
                          color: AppColor.redShade900,
                        ),
                      ),
                    ),
                  ],
                ),
                AppSizes.s100.verticalSpace,
                GestureDetector(
                  onTap: () {
                    final valid =
                        watch.formKey.currentState?.validate() ?? false;
                    if (valid) {
                      read.isFilledSI();
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
                            text: AppText.loginText,
                          )
                          : CustomDecoratedBox(
                            containerColor: AppColor.greyShade300,
                            textColor: AppColor.greyShade700,
                            text: AppText.loginText,
                          ),
                ),
                AppSizes.s40.verticalSpace,
                CustomForgetPassword(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
