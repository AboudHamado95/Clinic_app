import 'dart:ui' as ui;

import 'package:flutter/material.dart';
import 'package:sameha/constants/my_colors.dart';

class CustomTextFormField extends StatelessWidget {
  final String label;
  final double number;
  final TextEditingController textCtrl;
  const CustomTextFormField(
      {Key? key,
      required this.label,
      required this.number,
      required this.textCtrl})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final mediaWidth = MediaQuery.of(context).size.width;
    return Container(
      width: mediaWidth / number,
      child: TextFormField(
        controller: textCtrl,
        textInputAction: TextInputAction.next,
        textDirection: ui.TextDirection.rtl,
        textAlignVertical: TextAlignVertical.top,
        textAlign: TextAlign.right,
        cursorColor: Color(0xFFC8A0A8),
        decoration: InputDecoration(
          contentPadding: EdgeInsets.all(0.0),
          fillColor: MyColors.whiteColor,
          filled: true,
          labelText: label,
        ),
        // validator: (value) {
        //   if (value!.isEmpty) {
        //     return "";
        //   }
        // },
      ),
    );
  }
}
