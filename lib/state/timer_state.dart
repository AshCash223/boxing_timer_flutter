import 'package:flutter/material.dart';
import 'dart:async';

class TimerState extends ChangeNotifier {
  int _seconds = 0;
  bool _isRunning = false;
  late Stopwatch _stopwatch;
  Timer? _timer;

  // New properties for rounds and round duration
  int _roundDuration = 5; // in minutes
  int _rounds = 3;

  int get seconds => _seconds;
  bool get isRunning => _isRunning;
  int get roundDuration => _roundDuration;
  int get rounds => _rounds;

  TimerState() {
    _stopwatch = Stopwatch();
  }

  void toggleTimer() {
    if (_isRunning) {
      _stopwatch.stop();
      _timer?.cancel();
    } else {
      _stopwatch.start();
      _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
        updateTimer();
      });
    }
    _isRunning = !_isRunning;
    notifyListeners();
  }

  void resetTimer() {
    _stopwatch.reset();
    _seconds = 0;
    _isRunning = false;
    _timer?.cancel();
    notifyListeners();
  }

  void updateTimer() {
    _seconds = _stopwatch.elapsed.inSeconds;
    notifyListeners();
  }

  void setRoundDuration(int minutes) {
    _roundDuration = minutes;
    notifyListeners();
  }

  void setRounds(int rounds) {
    _rounds = rounds;
    notifyListeners();
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }
}
