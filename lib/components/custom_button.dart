import 'package:flutter/material.dart';
import 'package:sameha/constants/my_colors.dart';
import 'package:sameha/components/custom_text.dart';

class CustomButton extends StatelessWidget {
  final String name;
  final Widget icon;
  final double mediaW;
  final double mediaH;
  final String page;

  const CustomButton({
    Key? key,
    required this.name,
    required this.icon,
    required this.mediaW,
    required this.mediaH,
    required this.page,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: MaterialButton(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(24.0),
        ),
        color: MyColors.purpleColor,
        height: mediaH / 12.0,
        onPressed: () {
          Navigator.pushNamed(context, page);
        },
        child: Row(
          children: [
            ConstrainedBox(
                constraints: BoxConstraints(minWidth: mediaW / 7.42),
                child: CustomText(
                    name: name, fontSize: 16.0, color: MyColors.whiteColor)),
            SizedBox(width: mediaW / 25),
            icon
          ],
        ),
      ),
      // ),
    );
  }
}
