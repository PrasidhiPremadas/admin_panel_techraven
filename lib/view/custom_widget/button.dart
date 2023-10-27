// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class ButtonTile extends StatelessWidget {
  String text;
  ButtonTile({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    Color secondarycolor = const Color(0XFF112853);
    return Padding(
      padding:  EdgeInsets.only(top :2.w,right: 0.5.w),
      child: Container(
        height: 8.h,
        width: 15.w,
        color: secondarycolor,
        child: Center(
            child: Text(
          text,
          textAlign: TextAlign.center,
          style:const TextStyle(color: Colors.white),
        )),
      ),
    );
  }
}
