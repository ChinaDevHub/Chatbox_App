import 'package:flutter/material.dart';
import 'package:my_mentor/view/pages/onboard_page.dart';
import 'package:my_mentor/utils/constants/app_color.dart';
import 'package:my_mentor/utils/constants/app_duration.dart';
import 'package:my_mentor/utils/constants/app_image.dart';
import 'package:my_mentor/utils/helpers/go.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => SplashPageState();
}

class SplashPageState extends State<SplashPage> {
  //Page - da ilk calisan metod
  @override
  void initState() {
    super.initState();
    Future.delayed(AppDuration.second3, () {
      if (mounted) {
        // hemise check et
        Go.replace(context, OnboardPage());
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.white,
      body: Center(
        child: Image(
          image: AssetImage(AppImage.chatBoxLogo),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
