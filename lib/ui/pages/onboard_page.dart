import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:my_mentor/ui/pages/sign_in_page.dart';
import 'package:my_mentor/ui/pages/sign_up_page.dart';
import 'package:my_mentor/ui/widgets/custom_or_divider.dart';
import 'package:my_mentor/ui/widgets/custom_social_icon.dart';
import 'package:my_mentor/ui/widgets/custom_text.dart';
import 'package:my_mentor/utils/constants/app_color.dart';
import 'package:my_mentor/utils/constants/app_padding.dart';
import 'package:my_mentor/utils/constants/app_radius.dart';
import 'package:my_mentor/utils/constants/app_sizes.dart';
import 'package:my_mentor/utils/constants/app_image.dart';
import 'package:my_mentor/utils/constants/app_text.dart';
import 'package:my_mentor/utils/constants/app_text_fontweight.dart';
import 'package:my_mentor/utils/helpers/go.dart';

class OnboardPage extends StatelessWidget {
  const OnboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    log('Passed to onboard page');
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [AppColor.deepPurple, AppColor.black],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
          ),
          SafeArea(
            child: Column(
              children: [
                AppSizes.s15.vertical,
                Image.asset(AppImage.onboardChatLogo, fit: BoxFit.cover),
                AppSizes.s120.vertical,
                CustomText(
                  text: AppText.connectFriend,
                  color: AppColor.white,
                  fontSize: AppSizes.s45,
                ),
                AppSizes.s250.vertical,
                CustomText(
                  text: AppText.onboardDescription,
                  color: AppColor.white70,
                  fontSize: AppSizes.s18,
                ),
                AppSizes.s40.vertical,
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CustomSocialIcon(
                      path: AppImage.socialIconFB,
                      iconEdgeColor: AppColor.white,
                    ),
                    AppSizes.s20.horizontal,
                    CustomSocialIcon(
                      path: AppImage.socialIconGoogle,
                      iconEdgeColor: AppColor.white,
                    ),
                    AppSizes.s20.horizontal,
                    CustomSocialIcon(
                      path: AppImage.socialIconIos,
                      iconEdgeColor: AppColor.white,
                    ),
                  ],
                ),
                AppSizes.s40.vertical,
                CustomOrDivider(),
                AppSizes.s40.vertical,
                // Mail button
                Padding(
                  padding: AppPadding.h40,
                  child: ElevatedButton(
                    onPressed: () {
                      Go.to(context, const SignUpPage());
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColor.white,
                      foregroundColor: AppColor.black,
                      shape: RoundedRectangleBorder(
                        //! deyis all20
                        borderRadius: AppRadius.all20,
                      ),
                      //minimumSize: Size.fromHeight(AppSizes.s50),
                    ),
                    child: Padding(
                      padding: AppPadding.all8,
                      child: CustomText(
                        text: AppText.buttonText,
                        color: AppColor.black,
                        fontSize: AppSizes.s20,
                      ),
                    ),
                  ),
                ),
                AppSizes.s40.vertical,
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CustomText(
                      text: AppText.existAccount,
                      color: AppColor.white70,
                      fontSize: AppSizes.s16,
                    ),
                    TextButton(
                      onPressed: () {
                        Go.to(context, const SignInPage());
                      },
                      child: CustomText(
                        fontWeight: AppTextFontWeight.bold,
                        text: AppText.loginText,
                        color: AppColor.white,
                        fontSize: AppSizes.s16,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}