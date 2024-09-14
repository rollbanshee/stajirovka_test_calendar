// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stajirovka_test/features/resources/my_colors.dart';
import 'package:stajirovka_test/ui/screens/main/main_screen_widgets/custom_tabbar/custom_tabbar.dart';
import 'package:stajirovka_test/ui/screens/main/main_screen_widgets/top_row_date.dart';
import 'package:stajirovka_test/ui/screens/mood_diary/mood_diary_screen.dart';
import 'package:stajirovka_test/ui/screens/statistics/statistics_screen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen>
    with SingleTickerProviderStateMixin {
  late TabController controllerTab;
  int selectedIndex = 0;
  @override
  void initState() {
    controllerTab = TabController(length: 2, vsync: this);
    controllerTab.addListener(() {
      setState(() {});
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.bgLight,
      body: SafeArea(
          child: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(20.r),
            child: const TopRowDate(),
          ),
          Padding(
            padding: EdgeInsets.only(top: 4.h, bottom: 18.h),
            child: CustomTabBar(
              controllerTab: controllerTab,
            ),
          ),
          Expanded(
            child: TabBarView(
                physics: const NeverScrollableScrollPhysics(),
                controller: controllerTab,
                children: const [
                  MoodDiaryScreen(),
                  StatisticsScreen(),
                ]),
          ),
        ],
      )),
    );
  }
}
