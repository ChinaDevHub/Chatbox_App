import 'package:flutter/material.dart';

class Go {
  Go._();

  static void to(BuildContext context, Widget page) =>
      Navigator.push(context, MaterialPageRoute(builder: (_) => page));

  static void replace(BuildContext context, Widget page) =>
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (_) => page),
      );

  static void pop(BuildContext context) => Navigator.pop(context);
}
