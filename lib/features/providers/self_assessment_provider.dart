import 'package:flutter/widgets.dart';

class SelfAssessmentProvider extends ChangeNotifier {
  double initValue = 0.5;

  void onChangedValue(value) {
    initValue = value;
    notifyListeners();
  }
}
