import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stajirovka_test/features/constants/calendar_constants.dart';
import 'package:stajirovka_test/features/resources/my_colors.dart';
import 'package:stajirovka_test/features/resources/resources.dart';

class WeekDays extends StatelessWidget {
  const WeekDays({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.symmetric(vertical: 16.h, horizontal: 30.w),
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        for (String i in CalendarConstants.weekDats)
          Text(
            i,
            style:  TextStyle(
                fontFamily: MyFonts.nunito,
                fontWeight: FontWeight.w600,
                fontSize: 12.sp,
                color: MyColors.grey2),
          )
      ]),
    );
  }
}

