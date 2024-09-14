import 'package:flutter/widgets.dart';

class StressLevelProvider extends ChangeNotifier {
  double initValue = 0.5;

  void onChangedValue(value) {
    initValue = value;
    notifyListeners();
  }
}
