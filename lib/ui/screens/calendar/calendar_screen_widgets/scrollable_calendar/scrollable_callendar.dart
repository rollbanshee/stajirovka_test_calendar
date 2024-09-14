import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:scrollable_clean_calendar/scrollable_clean_calendar.dart';
import 'package:scrollable_clean_calendar/utils/enums.dart';
import 'package:stajirovka_test/features/providers/calendar_provider.dart';
import 'package:stajirovka_test/ui/other_widgets/bouncing_button.dart';
import 'package:stajirovka_test/ui/screens/calendar/calendar_screen_widgets/scrollable_calendar/callendar_day.dart';
import 'package:stajirovka_test/ui/screens/calendar/calendar_screen_widgets/scrollable_calendar/header_date.dart';

class ScrollableCalendar extends StatefulWidget {
  const ScrollableCalendar({
    super.key,
  });

  @override
  State<ScrollableCalendar> createState() => _ScrollableCalendarState();
}

class _ScrollableCalendarState extends State<ScrollableCalendar> {
  @override
  void initState() {
    final providerCalendar = context.read<CalendarProvider>();
    providerCalendar.saveController();
    providerCalendar.fromGridToMonth = false;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final providerCalendar = context.read<CalendarProvider>();

    return Expanded(
      child: ScrollableCleanCalendar(
          calendarController: providerCalendar.calendarController,
          layout: Layout.BEAUTY,
          locale: 'ru',
          padding: EdgeInsets.symmetric(vertical: 12.h, horizontal: 20.w),
          showWeekdays: false,
          spaceBetweenMonthAndCalendar: 12.h,
          calendarCrossAxisSpacing: 10.w,
          dayBuilder: (context, values) => CalendarDay(values: values),
          monthBuilder: (context, month) => BouncingButton(
                onPress: () {
                  providerCalendar.changeShowGridView();
                },
                child: HeaderDate(
                  month: month,
                ),
              )),
    );
  }
}
