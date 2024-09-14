import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:stajirovka_test/features/constants/calendar_constants.dart';
import 'package:stajirovka_test/features/providers/calendar_provider.dart';
import 'package:stajirovka_test/features/resources/my_colors.dart';
import 'package:stajirovka_test/features/resources/resources.dart';
import 'package:stajirovka_test/ui/screens/calendar/calendar_screen_widgets/gridview_calendar/sliver_grid_months.dart';

class GridViewCalendar extends StatelessWidget {
  const GridViewCalendar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final providerCalendar = context.read<CalendarProvider>();
    final minYear = providerCalendar.minDate.year.toString();
    final maxYear = providerCalendar.maxDate.year.toString();
    TextStyle textStyle = TextStyle(
        fontSize: 26.sp,
        fontWeight: FontWeight.w800,
        fontFamily: MyFonts.nunito,
        color: MyColors.black);
    return Expanded(
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: 20.w,
        ),
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: Padding(
                padding: EdgeInsets.only(bottom: 24.h),
                child: Center(
                  child: Text(
                    minYear,
                    style: textStyle,
                  ),
                ),
              ),
            ),
            const SliverGridMonths(
              months: CalendarConstants.months,
              year: 2024,
            ),
            SliverToBoxAdapter(
              child: Padding(
                padding: EdgeInsets.only(bottom: 24.h, top: 12.h),
                child: Center(
                  child: Text(
                    maxYear,
                    style: textStyle,
                  ),
                ),
              ),
            ),
            const SliverGridMonths(
                months: CalendarConstants.months, year: 2025),
          ],
        ),
      ),
    );
  }
}
