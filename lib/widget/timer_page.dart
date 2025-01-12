import 'package:flutter/material.dart';
import 'package:boxing_timer/state/timer_state.dart';
import 'package:boxing_timer/widget/settings_section.dart';
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
        backgroundColor: Colors.blue, // Set AppBar color to blue
        actions: [
          // Settings Button (Icon) on the right side of the AppBar
          IconButton(
            icon: const Icon(Icons.settings),
            onPressed: () {
              // Show the TimerSettings widget in a custom popup
              showDialog(
                context: context,
                builder: (context) {
                  return Dialog(
                    backgroundColor: Colors.black, // Set background color of the popup
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20), // Rounded corners for the popup
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Center(
                        child: Column(
                          mainAxisSize: MainAxisSize.min, // Ensure the dialog doesn't take up full screen
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            const Text(
                              'Timer Settings',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: 20),
                            TimerSettings(),
                            const SizedBox(height: 20),
                            ElevatedButton(
                              onPressed: () {
                                Navigator.of(context).pop(); // Close the dialog
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.blue, // Blue button color
                              ),
                              child: const Text(
                                'Close',
                                style: TextStyle(color: Colors.black), // Text color on button
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              );
            },
          ),
        ],
      ),
      body: Container(
        color: Colors.black, // Set the background color to black
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Timer Section
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Round ${timerState.currentRound} of ${timerState.rounds}',
                    style: const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.white, // White text color
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    'Round Timer: ${timerState.round_seconds ~/ 60}:${(timerState.round_seconds % 60).toString().padLeft(2, '0')}',
                    style: const TextStyle(
                      fontSize: 40,
                      fontWeight: FontWeight.bold,
                      color: Colors.white, // White text color
                    ),
                  ),
                  const SizedBox(height: 20),
                  Text(
                    'Rest Timer: ${timerState.rest_seconds ~/ 60}:${(timerState.rest_seconds % 60).toString().padLeft(2, '0')}',
                    style: const TextStyle(
                      fontSize: 40,
                      fontWeight: FontWeight.bold,
                      color: Colors.white, // White text color
                    ),
                  ),
                  const SizedBox(height: 40),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ElevatedButton(
                        onPressed: timerState.toggleTimer,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.blue, // Blue button color
                        ),
                        child: Text(
                          timerState.isRunning ? 'Pause' : 'Start',
                          style: const TextStyle(color: Colors.black), // Text color on button
                        ),
                      ),
                      const SizedBox(width: 20),
                      ElevatedButton(
                        onPressed: timerState.resetTimer,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.blue, // Blue button color
                        ),
                        child: const Text(
                          'Reset',
                          style: TextStyle(color: Colors.black), // Text color on button
                        ),
                      ),
                    ],
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
