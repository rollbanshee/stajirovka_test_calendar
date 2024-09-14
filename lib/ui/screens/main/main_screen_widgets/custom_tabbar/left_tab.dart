// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:stajirovka_test/features/resources/resources.dart';

class LeftTab extends StatelessWidget {
  const LeftTab({
    super.key,
    required this.check0,
  });

  final Color check0;

  @override
  Widget build(BuildContext context) {
    return Tab(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset(
            MySvg.diary,
            width: 12.w,
            color: check0,
          ),
          6.horizontalSpace,
          Text(
            'Дневник настроения',
            style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 12.sp,
                fontFamily: MyFonts.nunito,
                color: check0),
          )
        ],
      ),
    );
  }
}
