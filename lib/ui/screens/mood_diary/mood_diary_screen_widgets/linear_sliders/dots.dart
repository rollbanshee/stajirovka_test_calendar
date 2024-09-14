import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stajirovka_test/features/resources/my_colors.dart';

class Dots extends StatelessWidget {
  const Dots({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10.w),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          for (int i = 1; i < 7; i++)
            Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25).r,
                  color: MyColors.grey5),
              width: 2.w,
              height: 8.h,
            )
        ],
      ),
    );
  }
}
