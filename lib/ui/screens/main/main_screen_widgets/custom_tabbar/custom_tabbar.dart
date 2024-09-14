import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stajirovka_test/features/resources/my_colors.dart';
import 'package:stajirovka_test/ui/screens/main/main_screen_widgets/custom_tabbar/left_tab.dart';
import 'package:stajirovka_test/ui/screens/main/main_screen_widgets/custom_tabbar/right_tab.dart';

class CustomTabBar extends StatelessWidget {
  final TabController controllerTab;
  const CustomTabBar({
    super.key,
    required this.controllerTab,
  });

  @override
  Widget build(BuildContext context) {
    final Color check0 =
        controllerTab.index == 0 ? Colors.white : MyColors.grey2;
    final Color check1 =
        controllerTab.index == 1 ? Colors.white : MyColors.grey2;
    return Container(
      height: 30.h,
      decoration: BoxDecoration(
          color: MyColors.grey4, borderRadius: BorderRadius.circular(47)),
      child: TabBar(
          tabAlignment: TabAlignment.center,
          controller: controllerTab,
          labelPadding: EdgeInsets.symmetric(
            horizontal: 17.w,
          ),
          overlayColor: const WidgetStatePropertyAll(Colors.transparent),
          dividerColor: Colors.transparent,
          indicatorSize: TabBarIndicatorSize.tab,
          indicator: ShapeDecoration(
              color: MyColors.mandarin,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(47).r)),
          tabs: [LeftTab(check0: check0), RightTab(check1: check1)]),
    );
  }
}
