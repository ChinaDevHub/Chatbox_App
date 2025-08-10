import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_mentor/controllers/login_controller.dart';
import 'package:my_mentor/ui/pages/home_page.dart';
import 'package:my_mentor/ui/widgets/custom_decorated_box.dart';
import 'package:my_mentor/ui/widgets/custom_forget_password.dart';
import 'package:my_mentor/ui/widgets/custom_hint_text.dart';
import 'package:my_mentor/ui/widgets/custom_or_divider.dart';
import 'package:my_mentor/ui/widgets/custom_social_icon.dart';
import 'package:my_mentor/ui/widgets/custom_text_edit.dart';
import 'package:my_mentor/ui/widgets/custom_input.dart';
import 'package:provider/provider.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({super.key});

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {

  PreferredSize appBar(LoginController readData) {
    return PreferredSize(
      preferredSize: Size.fromHeight(60),
      child: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
          onPressed: () {
            readData.clearFields();
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back_ios_new, size: 25),
        ),
      ),
    );
  }

  Widget titleText() {
    return Center(
      child: Text(
        "Log in to Chatbox",
        style: CustomTextEdit.NORMAL_TEXT_STYLE(
          color: Colors.black,
          fontSize: 25,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  Widget subtitleText() {
    return Padding(
      padding: const EdgeInsets.all(45.0),
      child: Text(
        'Welcome back! Sign in using your social account or email to continue us',
        maxLines: 2,
        style: CustomTextEdit.NORMAL_TEXT_STYLE(
          color: Colors.grey.shade500,
          fontSize: 18,
        ),
      ),
    );
  }

  Widget socialMediaPart() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CustomSocialIcon(
          path: "assets/facebook.png",
          iconEdgeColor: Colors.black,
        ),
        20.horizontalSpace,
        CustomSocialIcon(
          path: 'assets/google.png',
          iconEdgeColor: Colors.black,
        ),
        20.horizontalSpace,
        CustomSocialIcon(path: 'assets/ios.png', iconEdgeColor: Colors.black),
      ],
    );
  }

  Widget inputPart(LoginController readData, LoginController watchData) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomHintText(text: "Your email"),
        CustomInput(
          ct: watchData.getEmail,
          checkForm: (p0) => readData.checkFormSI(),
          validator: watchData.validateEmail,
        ),
        20.verticalSpace,
        CustomHintText(text: 'Your password'),
        CustomInput(
          ct: watchData.getPassword,
          checkForm: (p0) => readData.checkFormSI(),
          validator: watchData.validatePassword,
          obscureText: !watchData.isVisible,
          suffic_icon: IconButton(
            onPressed: () {
              readData.toggleVisibility();
            },
            icon: Icon(
              watchData.isVisible ? Icons.visibility : Icons.visibility_off,
              color: Colors.red.shade900,
            ),
          ),
        ),
      ],
    );
  }

  Widget buttonPart(LoginController readData, LoginController watchData) {
    return GestureDetector(
      onTap: () {
        final valid = watchData.formKey.currentState?.validate() ?? false;
        if (valid) {
          readData.isFilledSI();
          Navigator.push(
            context,
            MaterialPageRoute(builder: (builder) => HomePage()),
          );
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              backgroundColor: Colors.redAccent,
              duration: Duration(seconds: 1),
              content: Text(
                'Please fill in all fields correctly.',
                style: CustomTextEdit.NORMAL_TEXT_STYLE(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          );
        }
      },
      child:
          watchData.isDisable
              ? CustomDecoratedBox(
                container_color: Colors.teal,
                text_color: Colors.white,
                text: 'Log In',
              )
              : CustomDecoratedBox(
                container_color: Colors.grey.shade300,
                text_color: Colors.grey.shade700,
                text: 'Log In',
              ),
    );
  }
  
  
  @override
  Widget build(BuildContext context) {
    final watchData = context.watch<LoginController>();
    final readData = context.read<LoginController>();
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: appBar(readData),
      body: SafeArea(
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          physics: BouncingScrollPhysics(),
          child: Form(
            key: watchData.formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                40.verticalSpace,
                titleText(),
                15.verticalSpace,
                subtitleText(),
                socialMediaPart(),
                20.verticalSpace,
                CustomOrDivider(),
                15.verticalSpace,
                inputPart(readData, watchData),
                100.verticalSpace,
                buttonPart(readData, watchData),
                40.verticalSpace,
                CustomForgetPassword(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
