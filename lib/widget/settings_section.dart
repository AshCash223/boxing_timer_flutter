import 'package:flutter/material.dart';
import 'package:boxing_timer/state/timer_state.dart';
import 'package:provider/provider.dart';

class TimerSettings extends StatelessWidget {
  const TimerSettings({super.key});

  @override
  Widget build(BuildContext context) {
    // Access TimerState via Provider
    final timerState = Provider.of<TimerState>(context);

    return Expanded(
      flex: 1,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Set Round Duration (Minutes)',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          Slider(
            min: 1,
            max: 10,
            value: timerState.roundDuration.toDouble(),
            divisions: 9,
            label: '${timerState.roundDuration} min',
            activeColor: Colors.green, // Set the active part of the slider to green
            onChanged: (value) {
              timerState.setRoundDuration(value.toInt());
            },
          ),
          const SizedBox(height: 20),
          const Text(
            'Set Rest Duration (Minutes)',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          Slider(
            min: 1,
            max: 10,
            value: timerState.roundDuration.toDouble(),
            divisions: 9,
            label: '${timerState.roundDuration} min',
            activeColor: Colors.green, // Set the active part of the slider to green
            onChanged: (value) {
              timerState.setRoundDuration(value.toInt());
            },
          ),
          const SizedBox(height: 20),
          const Text(
            'Set Number of Rounds',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          Slider(
            min: 1,
            max: 10,
            value: timerState.rounds.toDouble(),
            divisions: 9,
            label: '${timerState.rounds} rounds',
            activeColor: Colors.green, // Set the active part of the slider to green
            onChanged: (value) {
              timerState.setRounds(value.toInt());
            },
          ),
        ],
      ),
    );
  }
}
