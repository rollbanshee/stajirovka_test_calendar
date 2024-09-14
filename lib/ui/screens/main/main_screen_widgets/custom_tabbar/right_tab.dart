// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:stajirovka_test/features/resources/resources.dart';

class RightTab extends StatelessWidget {
  const RightTab({
    super.key,
    required this.check1,
  });

  final Color check1;

  @override
  Widget build(BuildContext context) {
    return Tab(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset(
            MySvg.statistics,
            width: 12.w,
            color: check1,
          ),
          6.horizontalSpace,
          Text(
            'Статистика',
            style: TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 12.sp,
              fontFamily: MyFonts.nunito,
              color: check1,
            ),
          )
        ],
      ),
    );
  }
}
