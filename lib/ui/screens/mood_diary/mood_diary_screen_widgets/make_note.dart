import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:stajirovka_test/features/providers/make_note_provider.dart';
import 'package:stajirovka_test/features/resources/my_colors.dart';
import 'package:stajirovka_test/features/resources/resources.dart';

class MakeNote extends StatelessWidget {
  const MakeNote({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final providerMakeNote = context.read<MakeNoteProvider>();
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 18.h, horizontal: 20.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Заметки',
            style: TextStyle(
                color: MyColors.black,
                fontFamily: MyFonts.nunito,
                fontSize: 16.sp,
                fontWeight: FontWeight.w800),
          ),
          20.verticalSpace,
          Container(
              height: 90.h,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(13).r,
                  boxShadow: const [
                    BoxShadow(
                        offset: Offset(2, 4),
                        blurRadius: 10,
                        spreadRadius: 0,
                        color: MyColors.shadow)
                  ]),
              child: TextField(
                controller: providerMakeNote.controllerNote,
                cursorColor: MyColors.grey2,
                style: TextStyle(
                    fontFamily: MyFonts.nunito,
                    fontWeight: FontWeight.w400,
                    fontSize: 14.sp,
                    color: MyColors.black),
                decoration: InputDecoration(
                    hintText: 'Введите заметку',
                    hintStyle: TextStyle(
                        fontFamily: MyFonts.nunito,
                        fontWeight: FontWeight.w400,
                        fontSize: 14.sp,
                        color: MyColors.grey2),
                    border: InputBorder.none,
                    contentPadding: EdgeInsets.all(10.w)),
                maxLines: 4,
              ))
        ],
      ),
    );
  }
}
