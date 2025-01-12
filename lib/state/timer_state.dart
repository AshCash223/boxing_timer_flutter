import 'dart:async';
import 'package:flutter/material.dart';

class TimerState with ChangeNotifier {
  int _roundDuration = 3; // default 3 minutes per round
  int _restDuration = 1; // default 1 minute rest between rounds
  int _rounds = 3; // default 3 rounds
  int _round_seconds = 180; // default time for round (in seconds)
  int _rest_seconds = 60; // default time for rest (in seconds)
  int _currentRound = 1; // the current round number
  bool _isRunning = false;
  bool _isResting = false; // To track if we are in a rest period
  late Timer _timer;

  // Getters
  int get roundDuration => _roundDuration;
  int get restDuration => _restDuration;
  int get rounds => _rounds;
  int get round_seconds => _round_seconds;
  int get rest_seconds => _rest_seconds;
  int get currentRound => _currentRound;
  bool get isRunning => _isRunning;
  bool get isResting => _isResting;

  // Setters
  void setRoundDuration(int duration) {
    _roundDuration = duration;
    _round_seconds = _roundDuration * 60; // update round seconds based on new round duration
    notifyListeners();
  }

  void setRestDuration(int duration) {
    _restDuration = duration;
    _rest_seconds = _restDuration * 60; // update rest seconds based on new rest duration
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
    _round_seconds = _roundDuration * 60;
    _rest_seconds = _restDuration * 60;
    _isRunning = false;
    _isResting = false;
    notifyListeners();
  }

  // Timer logic with round and rest periods
  void _startTimer() {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (_isResting) {
        // Rest timer logic
        if (_rest_seconds > 0) {
          _rest_seconds--;
        } else {
          // After rest time is over, start the next round
          if (_currentRound < _rounds) {
            _currentRound++;
            _rest_seconds = _restDuration * 60; // reset rest time
            _round_seconds = _roundDuration * 60; // reset round time
            _isResting = false; // switch to round timer
          } else {
            _timer.cancel(); // stop the timer when all rounds are complete
          }
        }
      } else {
        // Round timer logic
        if (_round_seconds > 0) {
          _round_seconds--;
        } else {
          // After round time is over, switch to rest period
          _isResting = true; // switch to rest timer
        }
      }
      notifyListeners();
    });
  }
}
