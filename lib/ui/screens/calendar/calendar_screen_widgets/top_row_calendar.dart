import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:stajirovka_test/features/providers/calendar_provider.dart';
import 'package:stajirovka_test/features/resources/my_colors.dart';
import 'package:stajirovka_test/features/resources/resources.dart';

class TopRowCalendar extends StatelessWidget {
  const TopRowCalendar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final providerCalendar = context.read<CalendarProvider>();
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 10.w),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          InkWell(
            customBorder: const CircleBorder(),
            onTap: () {
              Navigator.pop(context);
              FocusManager.instance.primaryFocus?.unfocus();
            },
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 6.w, vertical: 8.h),
              child: Icon(
                Icons.close_rounded,
                size: 28.sp,
                color: MyColors.grey2,
              ),
            ),
          ),
          InkWell(
            borderRadius: BorderRadius.circular(64).r,
            onTap: () {
              providerCalendar.showGridView
                  ? providerCalendar.changeShowGridView()
                  : providerCalendar.resetSelectedDay();
            },
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 8.h),
              child: Text(
                'Сегодня',
                style: TextStyle(
                    fontFamily: MyFonts.nunito,
                    fontWeight: FontWeight.w600,
                    fontSize: 18.sp,
                    color: MyColors.grey2),
              ),
            ),
          )
        ],
      ),
    );
  }
}
