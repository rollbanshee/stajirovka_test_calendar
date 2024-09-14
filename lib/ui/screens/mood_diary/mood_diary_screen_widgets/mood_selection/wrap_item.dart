import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stajirovka_test/features/resources/my_colors.dart';
import 'package:stajirovka_test/features/resources/resources.dart';
import 'package:stajirovka_test/ui/other_widgets/bouncing_button.dart';

class WrapItem extends StatelessWidget {
  final String text;
  final bool isActive;
  final VoidCallback onPress;

  const WrapItem(
      {super.key,
      required this.text,
      required this.isActive,
      required this.onPress});

  @override
  Widget build(BuildContext context) {
    final Color checkBg = isActive ? MyColors.mandarin : Colors.white;
    final Color checkText = isActive ? Colors.white : MyColors.black;

    return BouncingButton(
      onPress: onPress,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 3.h),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(3).r,
            color: checkBg,
            boxShadow: const [
              BoxShadow(
                  blurRadius: 10,
                  spreadRadius: 0,
                  color: MyColors.shadow,
                  offset: Offset(2, 4))
            ]),
        child: Text(
          text,
          style: TextStyle(
              fontFamily: MyFonts.nunito,
              fontSize: 11.sp,
              fontWeight: FontWeight.w400,
              color: checkText),
        ),
      ),
    );
  }
}
