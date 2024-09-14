import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:scrollable_clean_calendar/models/day_values_model.dart';
import 'package:scrollable_clean_calendar/utils/extensions.dart';
import 'package:stajirovka_test/features/providers/calendar_provider.dart';
import 'package:stajirovka_test/features/resources/my_colors.dart';
import 'package:stajirovka_test/features/resources/resources.dart';

class CalendarDay extends StatelessWidget {
  final DayValues values;
  const CalendarDay({
    super.key,
    required this.values,
  });

  @override
  Widget build(BuildContext context) {
    final providerCalendar = context.watch<CalendarProvider>();
    final checkColorBG = providerCalendar.checkColorBG(values);
    return Stack(
      children: [
        Container(
          alignment: Alignment.center,
          decoration:
              BoxDecoration(shape: BoxShape.circle, color: checkColorBG),
          child: Text(
            values.text,
            style: TextStyle(
                fontWeight: FontWeight.w500,
                fontFamily: MyFonts.nunito,
                fontSize: 18.sp,
                color: MyColors.black),
          ),
        ),
        Positioned.fill(
          bottom: 3.h,
          child: Align(
            alignment: Alignment.bottomCenter,
            child: Visibility(
              visible: values.day.isSameDay(DateTime.now()),
              child: Container(
                width: 6.w,
                height: 6.w,
                decoration: const BoxDecoration(
                    shape: BoxShape.circle, color: MyColors.mandarin),
              ),
            ),
          ),
        )
      ],
    );
  }
}
