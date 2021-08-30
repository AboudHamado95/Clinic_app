import 'package:flutter/material.dart';
import 'package:sameha/constants/my_colors.dart';
import 'dart:ui' as ui;

Widget bigTextFormField(TextEditingController textEditingController) {
  return Container(
    decoration: BoxDecoration(
      borderRadius: BorderRadius.all(Radius.circular(16.0)),
    ),
    width: double.infinity,
    child: TextFormField(
      controller: textEditingController,
      // textInputAction: TextInputAction.next,
      textDirection: ui.TextDirection.rtl,
      textAlignVertical: TextAlignVertical.top,
      maxLines: 5,
      textInputAction: TextInputAction.newline,
      keyboardType: TextInputType.multiline,
      cursorColor: MyColors.pinkColor,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.all(10.0),
        fillColor: Colors.grey[50],
        filled: true,
        hintText: 'الحالة المرضية',
        border: UnderlineInputBorder(
            borderRadius: BorderRadius.circular(16.0),
            borderSide: BorderSide.none),
      ),
      validator: (value) {
       
      },
    ),
  );
}
