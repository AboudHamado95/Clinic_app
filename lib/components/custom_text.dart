import 'package:flutter/material.dart';

class CustomText extends StatelessWidget {
  final String name;
  final double fontSize;
  final Color color;
  const CustomText(
      {Key? key,
      required this.name,
      required this.fontSize,
      required this.color})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      name,
      style: TextStyle(color: color, fontSize: fontSize),
    );
  }
}
