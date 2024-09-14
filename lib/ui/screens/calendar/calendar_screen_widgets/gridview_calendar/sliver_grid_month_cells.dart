import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:stajirovka_test/features/providers/calendar_provider.dart';

class CalendarMonthCells extends StatelessWidget {
  final DateTime date;

  const CalendarMonthCells({super.key, required this.date});

  @override
  Widget build(BuildContext context) {
    final providerCalendar = context.read<CalendarProvider>();
    providerCalendar.buildingMonthCells(date);
    final List<Widget> dayWidgets = providerCalendar.dayWidgets;
    return Wrap(spacing: 4.w, runSpacing: 3.h, children: dayWidgets);
  }
}
