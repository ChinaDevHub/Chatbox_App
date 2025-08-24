import 'package:flutter/material.dart';
import 'package:my_mentor/utils/constants/app_padding.dart';

class CustomInput extends StatelessWidget {
  const CustomInput({
    super.key,
    this.ct,
    required this.checkForm,
    this.obscureText = false,
    this.sufficIcon,
    this.errorText,
    this.validator,
  });

  final TextEditingController? ct;
  final void Function(String)? checkForm;
  final bool obscureText;
  final IconButton? sufficIcon;
  final String? errorText;
  final String? Function(String?)? validator;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: AppPadding.h20,
      child: TextFormField(
        validator: validator,
        obscureText: obscureText,
        onChanged: checkForm,
        controller: ct,
        decoration: InputDecoration(suffixIcon: sufficIcon,
        errorText: errorText,
        ),
      ),
    );
  }
}
