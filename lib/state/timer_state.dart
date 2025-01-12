import 'dart:async';
import 'package:flutter/material.dart';

class TimerState with ChangeNotifier {
  int _roundDuration = 3; // default 3 minutes per round
  int _rounds = 3; // default 3 rounds
  int _seconds = 0; // seconds left in the current round
  int _currentRound = 1; // the current round
  bool _isRunning = false;
  late Timer _timer;

  // Getters
  int get roundDuration => _roundDuration;
  int get rounds => _rounds;
  int get seconds => _seconds;
  int get currentRound => _currentRound;
  bool get isRunning => _isRunning;

  // Setters
  void setRoundDuration(int duration) {
    _roundDuration = duration;
    _seconds = _roundDuration * 60; // update seconds based on round duration
    notifyListeners();
  }

  void setRounds(int rounds) {
    _rounds = rounds;
    notifyListeners();
  }

  // Start or Pause Timer
  void toggleTimer() {
    if (_isRunning) {
      _timer.cancel();
    } else {
      _startTimer();
    }
    _isRunning = !_isRunning;
    notifyListeners();
  }

  // Reset the timer
  void resetTimer() {
    _currentRound = 1;
    _seconds = _roundDuration * 60;
    _isRunning = false;
    notifyListeners();
  }

  // Timer logic
  void _startTimer() {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (_seconds > 0) {
        _seconds--;
      } else {
        if (_currentRound < _rounds) {
          _currentRound++;
          _seconds = _roundDuration * 60; // reset to round duration
        } else {
          _timer.cancel(); // stop the timer when all rounds are complete
        }
      }
      notifyListeners();
    });
  }
}
