import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:stajirovka_test/features/providers/main_screen_provider.dart';
import 'package:stajirovka_test/features/providers/self_assessment_provider.dart';
import 'package:stajirovka_test/features/resources/my_colors.dart';
import 'package:stajirovka_test/features/resources/resources.dart';
import 'package:stajirovka_test/ui/other_widgets/custom_thumb_shape.dart';
import 'package:stajirovka_test/ui/screens/mood_diary/mood_diary_screen_widgets/linear_sliders/dots.dart';
import 'package:stajirovka_test/ui/screens/mood_diary/mood_diary_screen_widgets/linear_sliders/two_texts_row.dart';

class SelfAssessmentSlider extends StatelessWidget {
  const SelfAssessmentSlider({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final providerSelfAssessment = context.watch<SelfAssessmentProvider>();
    final providerMainScreen = context.watch<MainScreenProvider>();

    final Color checkColor = providerMainScreen.isAnyMoodActive(context)
        ? MyColors.mandarin
        : MyColors.grey5;

    final double checkValue = providerMainScreen.isAnyMoodActive(context)
        ? providerSelfAssessment.initValue
        : 0.5;

    final Function(double value)? checkOnChanged =
        providerMainScreen.isAnyMoodActive(context)
            ? (value) => providerSelfAssessment.onChangedValue(value)
            : null;

    return Padding(
      padding: EdgeInsets.symmetric(vertical: 18.h, horizontal: 20.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Самооценка',
            style: TextStyle(
                color: MyColors.black,
                fontFamily: MyFonts.nunito,
                fontSize: 16.sp,
                fontWeight: FontWeight.w800),
          ),
          20.verticalSpace,
          Container(
            padding: EdgeInsets.symmetric(vertical: 16.h),
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
            child: Column(
              children: [
                const Dots(),
                SliderTheme(
                  data: SliderThemeData(
                      trackHeight: 6.h,
                      thumbShape: CustomThumbShape(checkColor: checkColor),
                      overlayShape: SliderComponentShape.noOverlay),
                  child: Padding(
                    padding: EdgeInsets.symmetric(vertical: 4.h),
                    child: Slider(
                        overlayColor: WidgetStateColor.transparent,
                        activeColor: checkColor,
                        inactiveColor: MyColors.grey5,
                        value: checkValue,
                        onChanged: (value) {
                          checkOnChanged?.call(value);
                        }),
                  ),
                ),
                const TwoTextsRow(
                  leftText: 'Неуверенность',
                  rightText: 'Уверенность',
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
