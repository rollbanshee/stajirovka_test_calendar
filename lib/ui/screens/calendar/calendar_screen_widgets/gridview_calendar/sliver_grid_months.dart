import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:stajirovka_test/features/providers/calendar_provider.dart';
import 'package:stajirovka_test/features/resources/my_colors.dart';
import 'package:stajirovka_test/features/resources/resources.dart';
import 'package:stajirovka_test/ui/other_widgets/bouncing_button.dart';
import 'package:stajirovka_test/ui/screens/calendar/calendar_screen_widgets/gridview_calendar/sliver_grid_month_cells.dart';

class SliverGridMonths extends StatelessWidget {
  final List months;
  final int year;

  const SliverGridMonths({super.key, required this.months, required this.year});

  @override
  Widget build(BuildContext context) {
    final providerCalendar = context.read<CalendarProvider>();
    // final size = MediaQuery.of(context).size.width;
    return SliverGrid(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 0.98,
        crossAxisSpacing: 35.w,
        mainAxisSpacing: 37.h,
      ),
      delegate: SliverChildBuilderDelegate(
        childCount: year == 2025 ? months.length - 3 : months.length,
        (context, index) {
          return BouncingButton(
            onPress: () {
              providerCalendar.fromGridViewToMonth(DateTime(year, index));
            },
            behavior: HitTestBehavior.opaque,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  months[index],
                  style: TextStyle(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w700,
                      fontFamily: MyFonts.nunito,
                      color: MyColors.black),
                ),
                SizedBox(
                  height: 9.h,
                ),
                CalendarMonthCells(
                  date: DateTime(year, index + 1),
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
