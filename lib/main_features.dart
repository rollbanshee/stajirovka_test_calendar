import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:stajirovka_test/features/providers/calendar_provider.dart';
import 'package:stajirovka_test/features/providers/main_screen_provider.dart';
import 'package:stajirovka_test/features/providers/make_note_provider.dart';
import 'package:stajirovka_test/features/providers/mood_selection_provider.dart';
import 'package:stajirovka_test/features/providers/self_assessment_provider.dart';
import 'package:stajirovka_test/features/providers/stress_level_provider.dart';
import 'package:stajirovka_test/features/providers/toprow_provider.dart';
class MainFeatures {
  static buildProviders() {
    return [
      ChangeNotifierProvider(
        create: (context) => MainScreenProvider(),
      ),
      ChangeNotifierProvider(
        create: (context) => StressLevelProvider(),
      ),
      ChangeNotifierProvider(
        create: (context) => SelfAssessmentProvider(),
      ),
      ChangeNotifierProvider(
        create: (context) => MakeNoteProvider(),
      ),
      ChangeNotifierProvider(
        create: (context) => MoodSelectionProvider(),
      ),
      ChangeNotifierProvider(
        create: (context) => CalendarProvider(),
      ),
      ChangeNotifierProvider(
        create: (context) => TopRowProvider(),
      ),
    ];
  }

  static systemChrome() {
    SystemChrome.setPreferredOrientations(
        [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
    SystemChrome.setEnabledSystemUIMode(
      SystemUiMode.edgeToEdge,
    );
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
        systemNavigationBarColor: Colors.transparent));
  }
}
