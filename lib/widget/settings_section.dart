import 'package:flutter/material.dart';
import 'package:boxing_timer/state/timer_state.dart';
import 'package:provider/provider.dart';

class TimerSettings extends StatelessWidget {
  const TimerSettings({super.key});

  @override
  Widget build(BuildContext context) {
    // Access TimerState via Provider
    final timerState = Provider.of<TimerState>(context);

    return Container(
      padding: const EdgeInsets.all(20.0),
      decoration: BoxDecoration(
        color: Colors.black,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Set Round Duration (Minutes)',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white),
          ),
          Slider(
            min: 1,
            max: 10,
            value: timerState.roundDuration.toDouble(),
            divisions: 9,
            label: '${timerState.roundDuration} min',
            activeColor: Colors.blue, // Set the active part of the slider to blue
            onChanged: (value) {
              timerState.setRoundDuration(value.toInt());
            },
          ),
          const SizedBox(height: 20),
          const Text(
            'Set Rest Duration (Minutes)',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white),
          ),
          Slider(
            min: 1,
            max: 10,
            value: timerState.restDuration.toDouble(),
            divisions: 9,
            label: '${timerState.restDuration} min',
            activeColor: Colors.blue, 
            onChanged: (value) {
              timerState.setRestDuration(value.toInt());
            },
          ),
          const SizedBox(height: 20),
          const Text(
            'Set Number of Rounds',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white),
          ),
          Slider(
            min: 1,
            max: 10,
            value: timerState.rounds.toDouble(),
            divisions: 9,
            label: '${timerState.rounds} rounds',
            activeColor: Colors.blue, 
            onChanged: (value) {
              timerState.setRounds(value.toInt());
            },
          ),
        ],
      ),
    );
  }
}
