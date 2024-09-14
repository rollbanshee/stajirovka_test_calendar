import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stajirovka_test/features/resources/my_colors.dart';
import 'package:stajirovka_test/features/resources/resources.dart';

class TwoTextsRow extends StatelessWidget {
  final String leftText;
  final String rightText;
  const TwoTextsRow({
    super.key,
    required this.leftText,
    required this.rightText,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10.w),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            leftText,
            style: TextStyle(
                color: MyColors.sliderTexts,
                fontFamily: MyFonts.nunito,
                fontWeight: FontWeight.w400,
                fontSize: 11.sp),
          ),
          Text(
            rightText,
            style: TextStyle(
                color: MyColors.sliderTexts,
                fontFamily: MyFonts.nunito,
                fontWeight: FontWeight.w400,
                fontSize: 11.sp),
          ),
        ],
      ),
    );
  }
}
