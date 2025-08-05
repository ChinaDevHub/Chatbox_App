import 'package:flutter/material.dart';
import 'package:my_mentor/ui/widgets/custom_text_edit.dart';

class CustomForgetPassword extends StatelessWidget {
  const CustomForgetPassword({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => print('Forget clicked...'),
      child: Center(
        child: Text(
          'Forgot password?',
          style: CustomTextEdit.NORMAL_TEXT_STYLE(
            color: Colors.teal,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
