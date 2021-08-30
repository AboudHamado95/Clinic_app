import 'package:flutter/material.dart';
import 'package:sameha/constants/my_colors.dart';

final Widget addIcon = Icon(Icons.add, color: MyColors.whiteColor);
final Widget listAltIcon = Icon(Icons.list_alt, color: MyColors.whiteColor);
final Widget personIcon = Icon(
  Icons.person,
  color: MyColors.pinkColor,
);

Widget arrowBack(double size, Color color) {
  return Icon(Icons.arrow_back, size: size, color: color);
}

Widget searchIcon = Icon(
  Icons.search,
  color: Color(0xFFDD88B5),
);
