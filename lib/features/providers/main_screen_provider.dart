// ignore_for_file: avoid_function_literals_in_foreach_calls

import 'package:flutter/widgets.dart';

import 'package:provider/provider.dart';
import 'package:stajirovka_test/features/providers/make_note_provider.dart';
import 'package:stajirovka_test/features/providers/mood_selection_provider.dart';
import 'package:stajirovka_test/features/providers/self_assessment_provider.dart';
import 'package:stajirovka_test/features/providers/stress_level_provider.dart';

class MainScreenProvider extends ChangeNotifier {
  void cleanEverything(context) {
    final makeNoteProvider =
        Provider.of<MakeNoteProvider>(context, listen: false);
    final providerStressLevel =
        Provider.of<StressLevelProvider>(context, listen: false);
    final providerSelfAssessment =
        Provider.of<SelfAssessmentProvider>(context, listen: false);
    final providerMoodSelection =
        Provider.of<MoodSelectionProvider>(context, listen: false);
    makeNoteProvider.controllerNote.clear();
    providerMoodSelection.moodList.forEach((e) {
      e.isActive = false;
      e.isWrapActive = false;
    });
    providerStressLevel.initValue = 0.5;
    providerSelfAssessment.initValue = 0.5;
    providerMoodSelection.cleanWrap();
    notifyListeners();
  }

  bool isButtonActive(BuildContext context) {
    final makeNoteProvider =
        Provider.of<MakeNoteProvider>(context, listen: true);
    return isAnyMoodActive(context) &&
        makeNoteProvider.controllerNote.text.isNotEmpty;
  }

  bool isAnyMoodActive(context) {
    final providerMoodSelection =
        Provider.of<MoodSelectionProvider>(context, listen: true);
    return providerMoodSelection.moodList.any((e) => e.isActive);
  }
}
