import 'package:flutter/material.dart';
import 'package:my_mentor/ui/widgets/custom_text_edit.dart';

class CustomDecoratedBox extends StatelessWidget {
  CustomDecoratedBox({
    super.key,
    required this.container_color,
    required this.text_color,
    required this.text,
  });

  final Color container_color;
  final Color text_color;
  final String text;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      width: MediaQuery.of(context).size.width * 0.8,
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: container_color,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: Colors.grey.shade400),
        ),
        child: Center(
          child: Text(
            text,
            style: CustomTextEdit.NORMAL_TEXT_STYLE(
              color: text_color,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
