import 'package:flutter/material.dart';

import 'dart:ui';

class MyColors {
  static const Color whiteColor = Colors.white;
  static const Color purpleColor = Color(0x00FF381848);
  static const Color pinkColor = Color(0xFFDD88B5);
  static const Color redColor = Colors.redAccent;
    static const Color blackColor = Colors.black87;

}

Map<int, Color> color = {
  50: Color.fromRGBO(136, 14, 79, .1),
  100: Color.fromRGBO(136, 14, 79, .2),
  200: Color.fromRGBO(136, 14, 79, .3),
  300: Color.fromRGBO(136, 14, 79, .4),
  400: Color.fromRGBO(136, 14, 79, .5),
  500: Color.fromRGBO(136, 14, 79, .6),
  600: Color.fromRGBO(136, 14, 79, .7),
  700: Color.fromRGBO(136, 14, 79, .8),
  800: Color.fromRGBO(136, 14, 79, .9),
  900: Color.fromRGBO(136, 14, 79, 1),
};
MaterialColor colorCustom = MaterialColor(0xFFDD88B5, color);

