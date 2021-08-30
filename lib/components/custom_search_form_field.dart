import 'package:flutter/material.dart';
import 'package:sameha/constants/my_colors.dart';

import 'dart:ui' as ui;

import 'package:sameha/components/icons/icons.dart';

Widget searchFormfield() {
  return Container(
    child: TextFormField(
      textDirection: ui.TextDirection.rtl,
      textAlignVertical: TextAlignVertical.top,
      cursorColor: MyColors.pinkColor ,
      decoration: InputDecoration(
        prefixIcon: searchIcon,
        hintText: 'بحث',
        contentPadding: EdgeInsets.only(left: 0.0, top: 10.0),
        fillColor: Colors.white54,
        filled: true,
        border: UnderlineInputBorder(
            borderRadius: BorderRadius.circular(32.0),
            borderSide: BorderSide.none),
      ),
    ),
  );
}
