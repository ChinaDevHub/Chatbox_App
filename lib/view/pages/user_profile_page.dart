import 'package:flutter/material.dart';
import 'package:my_mentor/view/widgets/custom_divider.dart';
import 'package:my_mentor/view/widgets/custom_icon.dart';
import 'package:my_mentor/view/widgets/custom_text.dart';
import 'package:my_mentor/utils/constants/app_color.dart';
import 'package:my_mentor/utils/constants/app_icon.dart';
import 'package:my_mentor/utils/constants/app_image.dart';
import 'package:my_mentor/utils/constants/app_radius.dart';
import 'package:my_mentor/utils/constants/app_sizes.dart';
import 'package:my_mentor/utils/constants/app_text.dart';
import 'package:my_mentor/utils/constants/app_text_fontweight.dart';

class UserProfilePage extends StatelessWidget {
  const UserProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.greyShade900,
      appBar: AppBar(
        backgroundColor: AppColor.greyShade900,
        toolbarHeight: AppSizes.s350,
        centerTitle: true,
        title: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              backgroundImage: AssetImage(AppImage.storyImages.last),
              maxRadius: AppSizes.s50,
            ),
            AppSizes.s8.vertical,
            CustomText(
              text: AppText.cingizZaidov,
              color: AppColor.white,
              fontSize: AppSizes.s30,
              fontWeight: AppTextFontWeight.bold,
            ),
            AppSizes.s8.vertical,
            CustomText(
              text: AppText.dry,
              color: AppColor.greyShade400,
              fontSize: AppSizes.s15,
              fontWeight: AppTextFontWeight.bold,
            ),
            AppSizes.s25.vertical,
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                //AppSizes.s25.horizontal,
                CircleAvatar(
                  maxRadius: AppSizes.s30,
                  backgroundColor: AppColor.tealShade900,
                  child: CustomIcon(
                    icon: Icon(
                      AppIcon.chatBubble,
                      size: AppSizes.s30,
                      color: AppColor.white,
                    ),
                    onPressed: () {},
                  ),
                ),
                AppSizes.s25.horizontal,
                CircleAvatar(
                  maxRadius: AppSizes.s30,
                  backgroundColor: AppColor.tealShade900,
                  child: CustomIcon(
                    icon: Icon(
                      AppIcon.videoCam,
                      size: AppSizes.s30,
                      color: AppColor.white,
                    ),
                    onPressed: () {},
                  ),
                ),
                AppSizes.s25.horizontal,
                CircleAvatar(
                  maxRadius: AppSizes.s30,
                  backgroundColor: AppColor.tealShade900,
                  child: CustomIcon(
                    icon: Icon(
                      AppIcon.callIcon,
                      size: AppSizes.s30,
                      color: AppColor.white,
                    ),
                    onPressed: () {},
                  ),
                ),
                AppSizes.s25.horizontal,
                CircleAvatar(
                  maxRadius: AppSizes.s30,
                  backgroundColor: AppColor.tealShade900,
                  child: CustomIcon(
                    icon: Icon(
                      AppIcon.moreHoriz,
                      size: AppSizes.s30,
                      color: AppColor.white,
                    ),
                    onPressed: () {},
                  ),
                ),
                //AppSizes.s15.horizontal,
              ],
            ),
          ],
        ),
      ),
      body: DecoratedBox(
        decoration: BoxDecoration(
          borderRadius: AppRadius.top50,
          color: AppColor.greyShade200,
        ),
        child: Column(
          children: [
            AppSizes.s15.vertical,
            CustomDivider(
              radius: AppRadius.all40,
              height: 20,
              divColor: AppColor.grey,
              thickness: 4,
              endIndent: 150,
              indent: 150,
            ),
            AppSizes.s20.vertical,
            Expanded(
              child: ListView.builder(
                itemCount: AppText.userProfileTitles.length,
                physics: BouncingScrollPhysics(),
                itemBuilder: (context, index) {
                  return ListTile(
                    title: CustomText(
                      text: AppText.userProfileTitles[index],
                      color: AppColor.greyShade600,
                      fontSize: AppSizes.s15,
                    ),
                    subtitle: CustomText(
                      text: AppText.userProfileSubtitles[index],
                      color: AppColor.black,
                      fontSize: AppSizes.s20,
                      fontWeight: AppTextFontWeight.bold,
                    ),
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
