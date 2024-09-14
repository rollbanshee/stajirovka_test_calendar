import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:scrollable_clean_calendar/controllers/clean_calendar_controller.dart';
import 'package:scrollable_clean_calendar/models/day_values_model.dart';
import 'package:scrollable_clean_calendar/utils/extensions.dart';
import 'package:stajirovka_test/features/resources/my_colors.dart';
import 'package:stajirovka_test/features/resources/resources.dart';

class CalendarProvider extends ChangeNotifier {
  DateTime savedDate = DateTime.now();
  final minDate = DateTime(2024, 1, 1);
  final maxDate = DateTime.now().add(const Duration(days: 365));

  late CleanCalendarController calendarController;
  List<Widget> dayWidgets = [];
  bool showGridView = false;
  bool fromGridToMonth = false;
  DateTime? fromGridToMonthDate;

  void changeShowGridView() {
    showGridView = !showGridView;
    notifyListeners();
  }

  void buildingMonthCells(DateTime date) {
    final firstDayOfMonth = DateTime(date.year, date.month, 1);
    final lastDayOfMonth = DateTime(date.year, date.month + 1, 0);
    final int firstWeekday = firstDayOfMonth.weekday;

    dayWidgets.clear();
    for (int i = 1; i < firstWeekday; i++) {
      dayWidgets.add(SizedBox(
        width: 18.w,
        height: 18.w,
      ));
    }
    for (int i = 1; i <= lastDayOfMonth.day; i++) {
      final currentDate = DateTime(date.year, date.month, i);
      bool isNow = currentDate.isSameDay(DateTime.now());
      bool isSavedDate = currentDate.isSameDay(savedDate);
      dayWidgets.add(Stack(
        children: [
          Container(
            width: 18.w,
            height: 18.w,
            alignment: Alignment.center,
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: isSavedDate ? MyColors.mandarinLight : MyColors.bgLight),
            child: Text(
              '$i',
              style: TextStyle(
                  fontSize: 10.sp,
                  fontWeight: FontWeight.w500,
                  fontFamily: MyFonts.nunito,
                  color: MyColors.black),
            ),
          ),
          Positioned.fill(
            bottom: 1.h,
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Visibility(
                visible: isNow,
                child: Container(
                  width: 4.w,
                  height: 4.w,
                  decoration: const BoxDecoration(
                      shape: BoxShape.circle, color: MyColors.mandarin),
                ),
              ),
            ),
          )
        ],
      ));
    }
    while (dayWidgets.length % 7 != 0) {
      dayWidgets.add(SizedBox(
        width: 18.w,
        height: 18.w,
      ));
    }
  }

  Future<void> saveController() async {
    calendarController = CleanCalendarController(
      minDate: minDate,
      maxDate: maxDate,
      initialDateSelected: fromGridToMonth ? fromGridToMonthDate : savedDate,
      initialFocusDate: fromGridToMonth ? fromGridToMonthDate : savedDate,
      rangeMode: false,
      onDayTapped: (date) => savedDate = date,
    );
  }

  Widget a = Container(
    width: 18,
    height: 18,
    decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(color: MyColors.bgLight, width: 4)),
  );

  Color checkColorBG(DayValues values) {
    return values.day.isSameDay(savedDate)
        ? MyColors.mandarinLight
        : MyColors.bgLight;
  }

  void resetSelectedDay() async {
    savedDate = DateTime.now();
    calendarController.scrollToMonth(
      date: savedDate,
      duration: const Duration(milliseconds: 500),
    );
    notifyListeners();
  }

  void fromGridViewToMonth(date) async {
    fromGridToMonthDate = date;
    fromGridToMonth = true;
    changeShowGridView();
  }
}
