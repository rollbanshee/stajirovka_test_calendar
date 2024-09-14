import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stajirovka_test/ui/screens/mood_diary/mood_diary_screen_widgets/linear_sliders/self_assessment_slider.dart';
import 'package:stajirovka_test/ui/screens/mood_diary/mood_diary_screen_widgets/linear_sliders/stress_level_slider.dart';
import 'package:stajirovka_test/ui/screens/mood_diary/mood_diary_screen_widgets/mood_selection/mood_selection.dart';
import 'package:stajirovka_test/ui/screens/mood_diary/mood_diary_screen_widgets/make_note.dart';
import 'package:stajirovka_test/ui/screens/mood_diary/mood_diary_screen_widgets/save_button.dart';

class MoodDiaryScreen extends StatelessWidget {
  const MoodDiaryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 12.h),
              child: const Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisSize: MainAxisSize.min,
                children: [
                  MoodSelection(),
                  StressLevelSlider(),
                  SelfAssessmentSlider(),
                  MakeNote()
                ],
              ),
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.fromLTRB(20.w, 16.h, 20.w, 12.h),
          child: const SaveButton(),
        )
      ],
    );
  }
}
