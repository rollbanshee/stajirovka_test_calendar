import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:stajirovka_test/features/providers/main_screen_provider.dart';
import 'package:stajirovka_test/features/providers/mood_selection_provider.dart';
import 'package:stajirovka_test/features/resources/my_colors.dart';
import 'package:stajirovka_test/features/resources/resources.dart';
import 'package:stajirovka_test/ui/other_widgets/bouncing_button.dart';
import 'package:stajirovka_test/ui/screens/mood_diary/mood_diary_screen_widgets/mood_selection/listview_item.dart';

class MoodSelection extends StatelessWidget {
  const MoodSelection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final providerMoodSelection = context.watch<MoodSelectionProvider>();
    // ignore: unused_local_variable
    final providerMainScreen = context.watch<MainScreenProvider>();

    final moods = providerMoodSelection.moodList;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: Text(
            'Что чувствуешь?',
            style: TextStyle(
                color: MyColors.black,
                fontFamily: MyFonts.nunito,
                fontSize: 16.sp,
                fontWeight: FontWeight.w800),
          ),
        ),
        SizedBox(
          height: 160.h,
          child: ListView.builder(
              itemCount: moods.length,
              shrinkWrap: true,
              padding: EdgeInsets.fromLTRB(14.w, 18.h, 14.w, 18.h),
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) => Padding(
                    padding: EdgeInsets.symmetric(horizontal: 6.w),
                    child: BouncingButton(
                      onPress: () {
                        providerMoodSelection.index = index;
                        providerMoodSelection.onTapMood(context);
                      },
                      child: ListViewItem(
                        index: index,
                        moods: moods,
                      ),
                    ),
                  )),
        ),
        Visibility(
          visible: providerMoodSelection.index == null
              ? false
              : moods[providerMoodSelection.index!].isWrapActive,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.h),
            child: Wrap(
              spacing: 8.w,
              runSpacing: 8.h,
              children: providerMoodSelection.childrenWrap(),
            ),
          ),
        )
      ],
    );
  }
}
