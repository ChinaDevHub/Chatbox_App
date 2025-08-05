import 'package:flutter/material.dart';
import 'package:my_mentor/ui/widgets/custom_text_edit.dart';

class CustomHintText extends StatelessWidget {
  CustomHintText({super.key, required this.text});
  final String text;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Text(
        text,
        style: CustomTextEdit.NORMAL_TEXT_STYLE(
          color: Colors.teal,
          fontSize: 18,
        ),
      ),
    );
  }
}
