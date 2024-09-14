// ignore_for_file: avoid_function_literals_in_foreach_calls

import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:stajirovka_test/features/constants/mood_model_constants.dart';
import 'package:stajirovka_test/features/models/mood_model.dart';
import 'package:stajirovka_test/features/providers/self_assessment_provider.dart';
import 'package:stajirovka_test/features/providers/stress_level_provider.dart';
import 'package:stajirovka_test/features/resources/resources.dart';
import 'package:stajirovka_test/ui/screens/mood_diary/mood_diary_screen_widgets/mood_selection/wrap_item.dart';

class MoodSelectionProvider extends ChangeNotifier {
  int? index;
  static const _moodTexts = MoodModelConstants.moodTexts;
  static final _listOfMoods = MoodModelConstants.listOfMoods;

  final List<MoodModel> moodList = List.generate(
      MyImages.values.length,
      (index) => MoodModel(index, _moodTexts[index], MyImages.values[index],
          false, {for (var item in _listOfMoods[index]) item: false}, false));

  List<Widget> childrenWrap() {
    return index != null
        ? moodList[index!]
            .podMoods
            .entries
            .map((e) => WrapItem(
                  text: e.key,
                  isActive: e.value,
                  onPress: () {
                    onTapWrapItem(e.key);
                  },
                ))
            .toList()
        : [];
  }

  void onTapMood(context) {
    if (!moodList[index!].isActive) {
      moodList.forEach((e) => e.isWrapActive = false);
      moodList[index!].isActive = true;
      moodList[index!].isWrapActive = true;
    } else if (moodList[index!].isWrapActive) {
      moodList[index!].isActive = false;
      moodList[index!].isWrapActive = false;
      cleanWrap();
    } else {
      moodList.forEach((e) => e.isWrapActive = false);
      moodList[index!].isWrapActive = true;
    }
    if (moodList.every((e) => !e.isActive)) {
      final providerStressLevel =
          Provider.of<StressLevelProvider>(context, listen: false);
      final providerSelfAssessment =
          Provider.of<SelfAssessmentProvider>(context, listen: false);
      providerStressLevel.initValue = 0.5;
      providerSelfAssessment.initValue = 0.5;
    }
    notifyListeners();
  }

  void cleanWrap() {
    moodList[index!].podMoods.updateAll((key, value) => value = false);
  }

  void onTapWrapItem(key) {
    moodList[index!].podMoods[key] = !moodList[index!].podMoods[key]!;
    notifyListeners();
  }
}
