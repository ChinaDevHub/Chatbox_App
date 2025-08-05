import 'package:flutter/material.dart';
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
  @override
  Widget build(BuildContext context) {
    final watchData = context.watch<LoginController>();
    final readData = context.read<LoginController>();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(onPressed: (){
          readData.clearFields();
          Navigator.pop(context);
        }, icon: Icon(Icons.arrow_back_ios_new,size: 25,)),
        ),
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          physics: BouncingScrollPhysics(),
          child: Form(
            key: watchData.formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const SizedBox(height: 40),
                Center(
                  child: Text(
                    "Log in to Chatbox",
                    style: CustomTextEdit.NORMAL_TEXT_STYLE(
                      color: Colors.black,
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                SizedBox(height: 15),
                Padding(
                  padding: const EdgeInsets.all(45.0),
                  child: Text(
                    'Welcome back! Sign in using your social account or email to continue us',
                    maxLines: 2,
                    style: CustomTextEdit.NORMAL_TEXT_STYLE(
                      color: Colors.grey.shade500,
                      fontSize: 18,
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CustomSocialIcon(
                      path: "assets/facebook.png",
                      icon_edge_color: Colors.black,
                    ),
                    SizedBox(width: 20),
                    CustomSocialIcon(
                      path: 'assets/google.png',
                      icon_edge_color: Colors.black,
                    ),
                    SizedBox(width: 20),
                    CustomSocialIcon(
                      path: 'assets/ios.png',
                      icon_edge_color: Colors.black,
                    ),
                  ],
                ),
                SizedBox(height: 20),
                CustomOrDivider(),
                SizedBox(height: 15),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomHintText(text: "Your email"),
                    CustomInput(
                      ct: watchData.getEmail,
                      checkForm: (p0) => readData.checkFormSI(),
                      validator: watchData.validateEmail,
                    ),
                    SizedBox(height: 20),
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
                          watchData.isVisible ? Icons.visibility_off : Icons.visibility,
                          color: Colors.red.shade900,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 80),
                //if serti =>
                GestureDetector(
                  onTap: () {
                    final valid =
                      watchData.formKey.currentState?.validate() ?? false;
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
                ),
                SizedBox(height: 20),
                CustomForgetPassword(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
