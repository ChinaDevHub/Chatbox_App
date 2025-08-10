import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_mentor/ui/widgets/custom_divider.dart';

class CustomOrDivider extends StatelessWidget {
  const CustomOrDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        10.horizontalSpace,
        CustomDivider(indent: 20, endIndent: 10,divColor: Colors.white,thickness: 2,),
        const Text('OR', style: TextStyle(color: Colors.white70, fontSize: 20)),
        CustomDivider(indent: 10, endIndent: 20,divColor: Colors.white,thickness: 2,),
      ],
    );
  }
}
