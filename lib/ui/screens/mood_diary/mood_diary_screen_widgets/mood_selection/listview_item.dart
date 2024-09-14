import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stajirovka_test/features/models/mood_model.dart';
import 'package:stajirovka_test/features/resources/my_colors.dart';
import 'package:stajirovka_test/features/resources/resources.dart';

class ListViewItem extends StatelessWidget {
  final int index;
  final List<MoodModel> moods;
  const ListViewItem({
    super.key,
    required this.index,
    required this.moods,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 83.w,
      decoration: BoxDecoration(
          color: Colors.white,
          border: moods[index].isActive
              ? Border.all(color: MyColors.mandarin, width: 2.w)
              : null,
          borderRadius: BorderRadius.circular(76).r,
          boxShadow: const [
            BoxShadow(
                blurRadius: 10.8,
                spreadRadius: 0,
                color: MyColors.shadow,
                offset: Offset(2, 4))
          ]),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            moods[index].image,
            width: 50.w,
          ),
          Text(moods[index].name,
              style: TextStyle(
                  color: MyColors.black,
                  fontFamily: MyFonts.nunito,
                  fontSize: 11.sp,
                  fontWeight: FontWeight.w400))
        ],
      ),
    );
  }
}
