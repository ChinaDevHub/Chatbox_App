import 'package:flutter/material.dart';
import 'package:my_mentor/ui/pages/onboard_page.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _Splash_PageState();
}

class _Splash_PageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 3), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (builder) => OnboardPage()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    print("CLicked...");
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Image(
          image: AssetImage('assets/chatbox_logo.png'),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
