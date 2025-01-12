import 'package:boxing_timer/state/timer_state.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TimerHomePage extends StatelessWidget {
  const TimerHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    // Access TimerState via Provider
    final timerState = Provider.of<TimerState>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Boxing Timer App'),
        backgroundColor: Colors.blue,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Timer Section
            Expanded(
              flex: 2,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Time: ${timerState.seconds}s',
                    style: const TextStyle(
                      fontSize: 40,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: timerState.toggleTimer,
                    child: Text(timerState.isRunning ? 'Pause' : 'Start'),
                  ),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: timerState.resetTimer,
                    child: const Text('Reset'),
                  ),
                ],
              ),
            ),

            // Settings Section
            Expanded(
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
                    onChanged: (value) {
                      timerState.setRounds(value.toInt());
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
