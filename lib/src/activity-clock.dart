import 'package:flutter/material.dart';
import 'dart:async';
import 'analysis.dart';
import 'domain/activity.dart';

// stopwatch page
// shows progress bar with time remaining
// shows play buttons: pause_circle_outline, play_circle_outline (?) - stop(not_interested?, lens? highlight_off? )
// alarm when time ends
// silence alarm and continue (encourages wrong behavior - think carefully)

class ActivityClock extends StatefulWidget {
  static const routeName = '/activity-clock';
  ActivityClock({Key key, this.title}): super(key:key);

  final String title;
  _ActivityClock createState() => _ActivityClock();
}

class _ActivityClock extends State<ActivityClock> {
  Timer timer;
  Duration timeRemaining = new Duration(minutes: activity.allottedDuration);
  Duration timeout = const Duration(seconds: 1);
//  Duration ms = const Duration(milliseconds: 1);

  startTimer() {

//     TODO the following comes from https://api.flutter.dev/flutter/dart-async/Timer-class.html but what is milliseconds?
//    var duration = milliseconds == null ? timeout : ms * milliseconds;
    timer =  new Timer.periodic(timeout, handleTimerEvent);
//    timer =  new Timer.periodic(new Duration(seconds: 1), (time) {
//      print('Something');
//
//    });
  }

  void handleTimerEvent(Timer timer) {
    timeRemaining = timeRemaining - timeout;
    // TODO the toString returns 0:09:59.000000
    print(timeRemaining.toString());

  }

  void stopTimer() {
//    stopwatch.stop()
    timer.cancel();
  }

  void resumeTimer() {
//    stopwatch.start();
  }

  @override
  Widget build(BuildContext context) {
    final Activity activity = ModalRoute.of(context).settings.arguments;
    startTimer();
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('Deliberate Practice'),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            Text('Time remaining ${timeRemaining.toString()}.'),
            // TODO add progress bar
            // TODO add countdown timer (is progress bar enough?)
            // TODO play alert sound when time is up (and show timer going negative?)
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                // TODO show Pause when running, hide when stopped
                // TODO provide visual indication that app is paused? Is progress bar enough? Is swapping with
                // TODO Continue enough?
                IconButton(
                  padding: const EdgeInsets.only(),
                  icon: Icon(Icons.pause_circle_outline),
                  tooltip: 'Pause',
                  onPressed: () {
                    // TODO pause timer
                    stopTimer();
                    Navigator.pushNamed(context, Analysis.routeName);
                  },
                ),
                // TODO show Continue when running, hide when stopped
                IconButton(
                  padding: const EdgeInsets.only(),
                  icon: Icon(Icons.play_circle_outline),
                  tooltip: 'Continue',
                  onPressed: () {
                    // TODO start timer
                    Navigator.pushNamed(context, Analysis.routeName);
                  },
                ),
                IconButton(
                  padding: const EdgeInsets.only(),
                  icon: Icon(Icons.stop),
                  tooltip: 'Stop',
                  onPressed: () {
                    stopTimer();
                    Navigator.pushNamed(context, Analysis.routeName);
                  },
                ),
              ]
            ),
          ]
        )
      ),
    );
  }
}