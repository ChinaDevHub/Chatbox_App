import 'package:flutter/widgets.dart';

class AppRadius {
  AppRadius._();

  static const BorderRadius all10 = BorderRadius.all(Radius.circular(10));
  static const BorderRadius all20 = BorderRadius.all(Radius.circular(20));
  static BorderRadius circ20 = BorderRadius.circular(20);
  static const BorderRadius upCircle = BorderRadius.only(
    topLeft: Radius.circular(20),
    topRight: Radius.circular(20),
    bottomLeft: Radius.circular(0),
    bottomRight: Radius.circular(0),
  );
  static const BorderRadius all25 = BorderRadius.all(Radius.circular(25));
  static const BorderRadius all40 = BorderRadius.all(Radius.circular(40));
  static const BorderRadius all15 = BorderRadius.all(Radius.circular(15));
  static const BorderRadius top50 = BorderRadius.only(
    topLeft: Radius.circular(50),
    topRight: Radius.circular(50),
  );
}
