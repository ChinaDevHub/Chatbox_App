import 'package:flutter/material.dart';
import 'package:my_mentor/utils/constants/app_color.dart';
import 'package:my_mentor/utils/constants/app_icon.dart';
import 'package:my_mentor/utils/constants/app_sizes.dart';
import 'package:my_mentor/utils/constants/app_text.dart';

class CustomBottomNavBar extends StatelessWidget {
  const CustomBottomNavBar({
    super.key,
    required this.onTap,
    required this.currentIndex,
  });

  final void Function(int)? onTap;
  final int currentIndex;
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      unselectedItemColor: AppColor.blueGrey,
      selectedItemColor: AppColor.tealShade800,
      backgroundColor: AppColor.white,
      unselectedFontSize: AppSizes.s13,
      selectedFontSize: AppSizes.s18,
      type: BottomNavigationBarType.fixed,
      items: <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(AppIcon.messageIcon),
          label: AppText.messages,
        ),
        BottomNavigationBarItem(
          icon: Icon(AppIcon.callIcon),
          label: AppText.calls,
        ),
        BottomNavigationBarItem(
          icon: Icon(AppIcon.accountIcon),
          label: AppText.contacts,
        ),
        BottomNavigationBarItem(
          icon: Icon(AppIcon.settingIcon),
          label: AppText.settings,
        ),
      ],
      onTap: onTap,
      currentIndex: currentIndex,
    );
  }
}
