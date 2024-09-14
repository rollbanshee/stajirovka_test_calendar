import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stajirovka_test/features/resources/my_colors.dart';
import 'package:stajirovka_test/features/resources/resources.dart';

class HeaderDate extends StatelessWidget {
  final String month;
  const HeaderDate({
    super.key,
    required this.month,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          month.split(' ')[1],
          style: TextStyle(
              fontWeight: FontWeight.w700,
              fontFamily: MyFonts.nunito,
              fontSize: 16.sp,
              color: MyColors.grey2),
        ),
        // 12.verticalSpace,
        Text(
          month.split(' ')[0],
          style: TextStyle(
              fontWeight: FontWeight.w700,
              fontFamily: MyFonts.nunito,
              fontSize: 24.sp,
              color: MyColors.black),
        ),
      ],
    );
  }
}
