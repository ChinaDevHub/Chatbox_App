import 'package:flutter/material.dart';
import 'package:my_mentor/ui/pages/sign_in_page.dart';
import 'package:my_mentor/ui/pages/sign_up_page.dart';
import 'package:my_mentor/ui/widgets/custom_or_divider.dart';
import 'package:my_mentor/ui/widgets/custom_social_icon.dart';
import 'package:my_mentor/ui/widgets/custom_text_edit.dart';

class OnboardPage extends StatelessWidget {
  const OnboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [Colors.deepPurple, Colors.black],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
          ),
          SafeArea(
            child: Column(
              children: [
                const SizedBox(height: 15),
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
                const SizedBox(height: 250),
                Text(
                  'Our chat app is the perfect way to stay\nconnected with friends and family.',
                  textAlign: TextAlign.center,
                  style: CustomTextEdit.NORMAL_TEXT_STYLE(
                    color: Colors.white70,
                    fontSize: 18,
                  ),
                ),
                const SizedBox(height: 40),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CustomSocialIcon(
                      path: "assets/facebook.png",
                      icon_edge_color: Colors.white,
                    ),
                    SizedBox(width: 20),
                    CustomSocialIcon(
                      path: 'assets/google.png',
                      icon_edge_color: Colors.white,
                    ),
                    SizedBox(width: 20),
                    CustomSocialIcon(
                      path: 'assets/ios.png',
                      icon_edge_color: Colors.white,
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                CustomOrDivider(),
                SizedBox(height: 10),
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
                const SizedBox(height: 35),
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
          ),
        ],
      ),
    );
  }
}
