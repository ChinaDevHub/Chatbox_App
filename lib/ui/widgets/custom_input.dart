import 'package:flutter/material.dart';

class CustomInput extends StatelessWidget {
  CustomInput({
    super.key,
    required this.ct,
    required this.checkForm,
    this.obscureText = false,
    this.suffic_icon,
    this.errorText,
    this.validator,
  });

  final TextEditingController ct;
  final void Function(String)? checkForm;
  final bool obscureText;
  final IconButton? suffic_icon;
  final String? errorText;
  final String? Function(String?)? validator;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: TextFormField(
        validator: validator,
        obscureText: obscureText,
        onChanged: checkForm,
        controller: ct,
        decoration: InputDecoration(suffixIcon: suffic_icon,
        errorText: errorText,
        ),
      ),
    );
  }
}
