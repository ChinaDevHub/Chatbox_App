import 'package:flutter/widgets.dart';

class AppSizes {
  AppSizes._();

  static const double s15 = 15.0;
  static const double s120 = 120.0;
  static const double s250 = 250.0;
  static const double s40 = 40.0;
  static const double s20 = 20.0;
  static const double s50 = 50.0;
  static const double s25 = 25.0;
  static const double s100 = 100.0;
  static const double s45 = 45.0;
  static const double s18 = 18.0;
  static const double s16 = 16.0;
  static const double s30 = 30.0;
  static const double s140 = 140.0;
  static const double s22 = 22.0;
  static const double s23 = 23.0;
  static const double s150 = 150.0;
  static const double s2 = 2.0;
  static const double s3 = 3.0;
  static const double s17 = 17.0;
  static const double s10 = 10.0;
  static const double s180 = 180.0;
  static const double s1_25 = 1.25;
  static const double s12 = 12.0;
  static const double s5 = 5.0;
  static const double s1 = 1.0;
  static const double s70 = 70.0;
  static const double s6 = 6.0;
  static const double s220 = 220.0;
  static const double s35 = 35.0;
  static const double s13 = 13.0;
  static const double s8 = 8.0;
  static const double s4 = 4.0;
  static const double s60 = 60.0;
  static const double s0_7 = 0.70;
  static const double s400 = 400.0;
  static const double s80 = 80.0;
  static const double s350 = 350.0;
}

extension ScreenSize on double{
  Widget get vertical => SizedBox(height: this);
  Widget get horizontal => SizedBox(width: this);
}