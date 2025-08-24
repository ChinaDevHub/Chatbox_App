import 'package:flutter/material.dart';
import 'package:my_mentor/view/widgets/custom_icon.dart';
import 'package:my_mentor/view/widgets/custom_text.dart';
import 'package:my_mentor/utils/constants/app_color.dart';
import 'package:my_mentor/utils/constants/app_icon.dart';
import 'package:my_mentor/utils/constants/app_image.dart';
import 'package:my_mentor/utils/constants/app_radius.dart';
import 'package:my_mentor/utils/constants/app_sizes.dart';
import 'package:my_mentor/utils/constants/app_text.dart';
import 'package:my_mentor/utils/constants/app_text_fontweight.dart';

class SettingPage extends StatelessWidget {
  const SettingPage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.black,
      appBar: AppBar(
        automaticallyImplyLeading: true,
        toolbarHeight: AppSizes.s120,
        backgroundColor: AppColor.black,
        title: CustomText(
          text: AppText.settings,
          color: AppColor.white,
          fontSize: AppSizes.s25,
          fontWeight: AppTextFontWeight.bold,
        ),
        centerTitle: true,
      ),
      body: DecoratedBox(
        decoration: BoxDecoration(
          borderRadius: AppRadius.top50,
          color: AppColor.white,
        ),
        child: Column(
          children: [
            AppSizes.s50.vertical,
            Row(
              children: [
                AppSizes.s25.horizontal,
                CircleAvatar(
                  backgroundImage: AssetImage(AppImage.storyImages.last),
                  maxRadius: AppSizes.s40,
                ),
                AppSizes.s15.horizontal,
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomText(
                      text: AppText.cingizZaidov,
                      color: AppColor.black,
                      fontSize: AppSizes.s25,
                      fontWeight: AppTextFontWeight.bold,
                    ),
                    CustomText(
                      text: AppText.neverGiveUp,
                      color: AppColor.grey,
                      fontSize: AppSizes.s17,
                    ),
                  ],
                ),
                Spacer(),
                CustomIcon(
                  icon: Icon(
                    AppIcon.qrCode,
                    size: AppSizes.s30,
                    color: AppColor.green,
                  ),
                  onPressed: () {
                    //Go.to(context, UserProfilePage());
                  },
                ),
                AppSizes.s20.horizontal,
              ],
            ),
            AppSizes.s50.vertical,
            Expanded(
              child: ListView.builder(
                physics: BouncingScrollPhysics(),
                itemExtent: AppSizes.s80,
                itemCount: AppText.settingTitleList.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    leading: CircleAvatar(
                      maxRadius: AppSizes.s25,
                      backgroundColor: AppColor.greyShade200,
                      child: Icon(
                        AppIcon.settingIconList[index],
                        size: AppSizes.s30,
                      ),
                    ),
                    title: CustomText(
                      text: AppText.settingTitleList[index],
                      color: AppColor.black,
                      fontSize: AppSizes.s23,
                      fontWeight: AppTextFontWeight.bold,
                    ),
                    subtitle:
                        (index < AppText.settingSubtitleList.length)
                            ? CustomText(
                              text: AppText.settingSubtitleList[index],
                              color: AppColor.black54,
                              fontSize: AppSizes.s13,
                            )
                            : null,
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
