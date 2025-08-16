import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:my_mentor/controllers/login_controller.dart';
import 'package:my_mentor/ui/pages/messages_page.dart';
import 'package:my_mentor/ui/widgets/custom_bottom_nav_bar.dart';
import 'package:my_mentor/ui/widgets/custom_text.dart';
import 'package:my_mentor/utils/constants/app_color.dart';
import 'package:my_mentor/utils/constants/app_icon.dart';
import 'package:my_mentor/utils/constants/app_image.dart';
import 'package:my_mentor/utils/constants/app_padding.dart';
import 'package:my_mentor/utils/constants/app_radius.dart';
import 'package:my_mentor/utils/constants/app_scroll_direction.dart';
import 'package:my_mentor/utils/constants/app_sizes.dart';
import 'package:my_mentor/utils/constants/app_text.dart';
import 'package:my_mentor/utils/constants/app_text_fontweight.dart';
import 'package:my_mentor/utils/helpers/go.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final watch = context.watch<LoginController>();
    return Scaffold(
      backgroundColor: AppColor.black,
      appBar: AppBar(
        leading: Image.asset(AppImage.searchIcon, fit: BoxFit.scaleDown),
        backgroundColor: AppColor.black,
        title: CustomText(
          text: AppText.home,
          color: AppColor.white,
          fontSize: AppSizes.s22,
        ),
        centerTitle: true,
        actions: [
          Padding(
            padding: AppPadding.h20,
            child: CircleAvatar(
              backgroundImage: AssetImage(AppImage.storyImages.first),
              radius: AppSizes.s23,
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        scrollDirection: AppScrollDirection.v,
        physics: BouncingScrollPhysics(),
        child: Column(
          children: [
            AppSizes.s40.verticalSpace,
            SizedBox(
              height: AppSizes.s150,
              child: ListView.builder(
                scrollDirection: AppScrollDirection.h,
                physics: BouncingScrollPhysics(),
                itemCount: AppImage.storyImages.length,
                itemBuilder: (context, i) {
                  return Padding(
                    padding: AppPadding.r10l15,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        DecoratedBox(
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: AppColor.storyEdgeColors[i],
                              width: AppSizes.s3,
                            ),
                            shape: BoxShape.circle,
                          ),
                          child: Padding(
                            padding: AppPadding.all5,
                            child: CircleAvatar(
                              backgroundImage: AssetImage(
                                AppImage.storyImages[i],
                              ),
                              maxRadius: AppSizes.s50,
                            ),
                          ),
                        ),
                        AppSizes.s15.verticalSpace,
                        Center(
                          child: CustomText(
                            text: AppText.statusNames[i],
                            color: AppColor.white,
                            fontSize: AppSizes.s17,
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
            AppSizes.s40.verticalSpace,
            DecoratedBox(
              decoration: BoxDecoration(
                color: AppColor.white,
                borderRadius: AppRadius.upCircle,
              ),
              child: Column(
                children: [
                  AppSizes.s10.verticalSpace,
                  Divider(
                    color: AppColor.grey,
                    endIndent: AppSizes.s180,
                    indent: AppSizes.s180,
                    thickness: AppSizes.s3,
                  ),
                  AppSizes.s20.verticalSpace,
                  ListView.builder(
                    shrinkWrap: true,
                    scrollDirection: AppScrollDirection.v,
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: AppImage.storyImages.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: AppPadding.v10,
                        child: Slidable(
                          key: ValueKey(index),
                          endActionPane: ActionPane(
                            motion: StretchMotion(),
                            children: [
                              //Notifications Icon
                              SlidableAction(
                                padding: AppPadding.all10,
                                borderRadius: AppRadius.all25,
                                onPressed: (context) {
                                  log(AppText.notificationClicked);
                                },
                                icon: AppIcon.notif,
                                label: AppText.notifications,
                                backgroundColor: AppColor.blue,
                                foregroundColor: AppColor.white,
                              ),
                              //Delete Icon
                              SlidableAction(
                                borderRadius: AppRadius.all25,
                                onPressed: (context) {
                                  log(AppText.deleteClicked);
                                },
                                icon: AppIcon.delete,
                                label: AppText.delete,
                                backgroundColor: AppColor.red,
                              ),
                            ],
                          ),
                          child: Card(
                            color: AppColor.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: AppRadius.all15,
                            ),
                            child: ListTile(
                              onTap:
                                  () => Go.to(
                                    context,
                                    MessagesPage(
                                      profileIcon: CircleAvatar(
                                        backgroundImage: AssetImage(
                                          AppImage.storyImages[index],
                                        ),
                                        radius: AppSizes.s20,
                                      ),
                                      profileName: CustomText(
                                        text: AppText.messageTitle[index],
                                        color: AppColor.black,
                                        fontSize: AppSizes.s20,
                                      ),
                                    ),
                                  ),
                              leading: Transform.scale(
                                scale: AppSizes.s1_25,
                                child: CircleAvatar(
                                  backgroundImage: AssetImage(
                                    AppImage.storyImages[index],
                                  ),
                                ),
                              ),
                              title: CustomText(
                                text: AppText.messageTitle[index],
                                color: AppColor.black,
                                fontSize: AppSizes.s20,
                                fontWeight: AppTextFontWeight.bold,
                              ),
                              subtitle: CustomText(
                                color: AppColor.blueGreyShade600,
                                text: AppText.messageSubTitle[index],
                                fontSize: AppSizes.s12,
                                fontWeight: AppTextFontWeight.w600,
                              ),
                              trailing: Column(
                                children: [
                                  Text(AppText.twoMinAgo),
                                  AppSizes.s5.verticalSpace,
                                  index % 2 == 0
                                      ? CircleAvatar(
                                        backgroundColor: AppColor.redShade700,
                                        child: Center(
                                          child: CustomText(
                                            text: AppText.four,
                                            color: AppColor.white,
                                            fontSize: AppSizes.s10,
                                          ),
                                        ),
                                        maxRadius: 12,
                                      )
                                      : Text(''),
                                ],
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: CustomBottomNavBar(
        onTap: watch.onTapped,
        currentIndex: watch.selectedIndex,
      ),
    );
  }
}
