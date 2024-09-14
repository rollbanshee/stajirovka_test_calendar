// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:stajirovka_test/features/resources/my_colors.dart';
import 'package:stajirovka_test/features/resources/resources.dart';

class StatisticsScreen extends StatelessWidget {
  const StatisticsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.bgLight,
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(
              MySvg.statistics,
              color: MyColors.mandarin,
              width: 32.w,
            ),
            5.horizontalSpace,
            Text(
              'Статистика',
              style: TextStyle(
                  fontFamily: MyFonts.nunito,
                  color: MyColors.mandarin,
                  fontSize: 24.sp,
                  fontWeight: FontWeight.w500),
            ),
          ],
        ),
      ),
    );
  }
}
