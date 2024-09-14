import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:stajirovka_test/features/providers/calendar_provider.dart';
import 'package:stajirovka_test/features/resources/my_colors.dart';
import 'package:stajirovka_test/ui/screens/calendar/calendar_screen_widgets/gridview_calendar/gridview_calendar.dart';
import 'package:stajirovka_test/ui/screens/calendar/calendar_screen_widgets/scrollable_calendar/scrollable_callendar.dart';
import 'package:stajirovka_test/ui/screens/calendar/calendar_screen_widgets/top_row_calendar.dart';
import 'package:stajirovka_test/ui/screens/calendar/calendar_screen_widgets/scrollable_calendar/week_days.dart';

class CalendarScreen extends StatelessWidget {
  const CalendarScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final providerCalendar = context.watch<CalendarProvider>();
    return Scaffold(
      backgroundColor: MyColors.bgLight,
      body: SafeArea(
        bottom: false,
        child: Column(
          children: [
            const TopRowCalendar(),
            if (!providerCalendar.showGridView) const WeekDays(),
            if (!providerCalendar.showGridView) const ScrollableCalendar(),
            if (providerCalendar.showGridView) const GridViewCalendar(),
          ],
        ),
      ),
    );
  }
}
