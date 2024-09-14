import 'dart:async';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TopRowProvider extends ChangeNotifier {
  Timer? _timer;
  String formattedDateTime = '';

  TopRowProvider() {
    _startTimer();
  }

  void _startTimer() {
    _updateDateTime();

    final now = DateTime.now();
    final int secondsUntilNextMinute = 60 - now.second;

    _timer = Timer(Duration(seconds: secondsUntilNextMinute), () {
      _updateDateTime();
      _timer = Timer.periodic(const Duration(minutes: 1), (Timer timer) {
        _updateDateTime();
      });
    });
  }

  void _updateDateTime() {
    final now = DateTime.now();
    final dateString = DateFormat('d MMMM', 'ru_RU').format(now);
    final timeString = DateFormat('HH:mm', 'ru_RU').format(now);
    formattedDateTime = '$dateString $timeString';

    notifyListeners();
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }
}
