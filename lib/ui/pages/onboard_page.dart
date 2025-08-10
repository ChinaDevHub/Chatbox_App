import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_mentor/ui/pages/sign_in_page.dart';
import 'package:my_mentor/ui/pages/sign_up_page.dart';
import 'package:my_mentor/ui/widgets/custom_or_divider.dart';
import 'package:my_mentor/ui/widgets/custom_social_icon.dart';
import 'package:my_mentor/ui/widgets/custom_text_edit.dart';

class OnboardPage extends StatelessWidget {
  const OnboardPage({super.key});

Widget screenColor(){
  return Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [Colors.deepPurple, Colors.black],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
          );
}


Widget screenElement(BuildContext context){
  return SafeArea(
            child: Column(
              children: [
                15.verticalSpace,
                Image.asset('assets/onboard_chat.png', fit: BoxFit.cover),
                const SizedBox(height: 120),
                Text(
                  'Connect friends',
                  textAlign: TextAlign.center,
                  style: CustomTextEdit.NORMAL_TEXT_STYLE(
                    color: Colors.white,
                    fontSize: 45,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                250.verticalSpace,
                Text(
                  'Our chat app is the perfect way to stay\nconnected with friends and family.',
                  textAlign: TextAlign.center,
                  style: CustomTextEdit.NORMAL_TEXT_STYLE(
                    color: Colors.white70,
                    fontSize: 18,
                  ),
                ),
                40.verticalSpace,
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CustomSocialIcon(
                      path: "assets/facebook.png",
                      iconEdgeColor: Colors.white,
                    ),
                    20.horizontalSpace,
                    CustomSocialIcon(
                      path: 'assets/google.png',
                      iconEdgeColor: Colors.white,
                    ),
                    20.horizontalSpace,
                    CustomSocialIcon(
                      path: 'assets/ios.png',
                      iconEdgeColor: Colors.white,
                    ),
                  ],
                ),
                40.verticalSpace,
                CustomOrDivider(),
                40.verticalSpace,
                // Mail button
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 40.0),
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (builder) => SignUpPage()),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      foregroundColor: Colors.black,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      minimumSize: const Size.fromHeight(50),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        'Sign up with mail',
                        style: CustomTextEdit.NORMAL_TEXT_STYLE(
                          color: Colors.black,
                          fontSize: 20,
                        ),
                      ),
                    ),
                  ),
                ),
                40.verticalSpace,
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Existing account?',
                      style: CustomTextEdit.NORMAL_TEXT_STYLE(
                        color: Colors.white70,
                        fontSize: 16,
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (builder) => SignInPage()),
                        );
                      },
                      child: Text(
                        'Log In',
                        style: CustomTextEdit.NORMAL_TEXT_STYLE(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          );
}


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          screenColor(),
          screenElement(context),
        ],
      ),
    );
  }
}
