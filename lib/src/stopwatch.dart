import 'package:flutter/material.dart';
import 'analysis.dart';
import 'domain/activity.dart';

// stopwatch page
// shows progress bar with time remaining
// shows play buttons: pause_circle_outline, play_circle_outline (?) - stop(not_interested?, lens? highlight_off? )
// alarm when time ends
// silence alarm and continue (encourages wrong behavior - think carefully)

class Stopwatch extends StatelessWidget{
  static const routeName = '/stopwatch';

  @override
  Widget build(BuildContext context) {
    final Activity activity = ModalRoute.of(context).settings.arguments;
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('Deliberate Practice'),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            Text('To be completed in ${activity.allottedDuration} minutes.'),
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
                    // TODO stop timer
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