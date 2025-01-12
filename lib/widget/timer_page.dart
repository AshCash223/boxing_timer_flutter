import 'package:boxing_timer/state/timer_state.dart';
import 'package:boxing_timer/widget/settings_section.dart';
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
        backgroundColor: Colors.green,
      ),
      body: Container(
        color: Colors.lime, // Set the background color to lime (you can adjust)
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
                    'Round ${timerState.currentRound} of ${timerState.rounds}',
                    style: const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    'Round Timer: ${timerState.round_seconds ~/ 60}:${(timerState.round_seconds % 60).toString().padLeft(2, '0')}',
                    style: const TextStyle(
                      fontSize: 40,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 20),
                  Text(
                    'Reset Timer: ${timerState.rest_seconds ~/ 60}:${(timerState.rest_seconds % 60).toString().padLeft(2, '0')}',
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

            // Use TimerSettings widget
            const TimerSettings(),  // Include the TimerSettings widget
          ],
        ),
      ),
    );
  }
}
