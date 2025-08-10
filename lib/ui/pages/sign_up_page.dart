import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_mentor/controllers/login_controller.dart';
import 'package:my_mentor/ui/pages/home_page.dart';
import 'package:my_mentor/ui/widgets/custom_decorated_box.dart';
import 'package:my_mentor/ui/widgets/custom_hint_text.dart';
import 'package:my_mentor/ui/widgets/custom_text_edit.dart';
import 'package:my_mentor/ui/widgets/custom_input.dart';
import 'package:provider/provider.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
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
        "Sign up with Email",
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
      padding: const EdgeInsets.all(30.0),
      child: Text(
        'Get chatting with friends and family today by signing up for our chat app!',
        maxLines: 2,
        style: CustomTextEdit.NORMAL_TEXT_STYLE(
          color: Colors.grey.shade500,
          fontSize: 18,
        ),
      ),
    );
  }

  Widget inputPart(LoginController watchData) {
    return Form(
      key: watchData.formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomHintText(text: "Your name"),
          CustomInput(
            ct: watchData.getName,
            checkForm: (p0) => context.read<LoginController>().checkFormSU(),
            validator: watchData.validateName,
          ),
          30.verticalSpace,
          CustomHintText(text: 'Your email'),
          CustomInput(
            ct: watchData.getEmail,
            checkForm: (p0) => context.read<LoginController>().checkFormSU(),
            validator: watchData.validateEmail,
          ),
          30.verticalSpace,
          CustomHintText(text: 'Password'),
          CustomInput(
            ct: watchData.getPassword,
            checkForm: (p0) => context.read<LoginController>().checkFormSU(),
            validator: watchData.validatePassword,
            obscureText: !watchData.isVisible,
            suffic_icon: IconButton(
              icon: Icon(
                watchData.isVisible ? Icons.visibility : Icons.visibility_off,
                color: Colors.red.shade900,
              ),
              onPressed: () {
                context.read<LoginController>().toggleVisibility();
              },
            ),
          ),
          30.verticalSpace,
          CustomHintText(text: 'Confirm Password'),
          CustomInput(
            ct: watchData.getConfirmPassword,
            checkForm: (p0) => context.read<LoginController>().checkFormSU(),
            validator: watchData.validateConfirmPassword,
          ),
        ],
      ),
    );
  }

  Widget buttonPart(LoginController readData, LoginController watchData) {
    return GestureDetector(
      onTap: () {
        final valid = watchData.formKey.currentState?.validate() ?? false;
        if (valid) {
          readData.isFilledSU();
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
                text: 'Create an account',
              )
              : CustomDecoratedBox(
                container_color: Colors.grey.shade300,
                text_color: Colors.grey.shade700,
                text: 'Create an account',
              ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final readData = context.read<LoginController>();
    final watchData = context.watch<LoginController>();
    return Scaffold(
      appBar: appBar(readData),
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          physics: BouncingScrollPhysics(),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              40.verticalSpace,
              titleText(),
              subtitleText(),
              15.verticalSpace,
              inputPart(watchData),
              140.verticalSpace,
              buttonPart(readData, watchData),
            ],
          ),
        ),
      ),
    );
  }
}
