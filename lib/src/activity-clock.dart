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
  Timer _timer;
  Duration _timeRemaining;
  Duration timeout = const Duration(seconds: 1);
  Icon pauseIcon = const Icon(Icons.pause_circle_outline);
  Icon playIcon = const Icon(Icons.play_circle_outline);
  Icon _pausePlayIcon;
  String _pausePlayTooltip;
// SEE: for below  https://trello.com/invite/b/Le8rQr0e/d3c07089afd1b451dc1681becfb2d47a/deliberate-action
  toHHMMSS(Duration d) => d.toString().split('.').first.padLeft(8, "0");
  toMMSS(Duration d) => d.toString().substring(2, 7);

  @override
  void initState() {
    startTimer();
    _timeRemaining = new Duration(minutes: activity.allottedDuration);
    _pausePlayIcon = pauseIcon;
    _pausePlayTooltip = 'Pause';
  }

  startTimer() {
    _timer =  new Timer.periodic(timeout, handleTimerEvent);
  }

  void stopTimer() {
    _timer.cancel();
  }

  void handleTimerEvent(Timer timer) {
    setState(() {
      _timeRemaining = _timeRemaining - timeout;
      if (_timeRemaining.inMilliseconds == 0) {
        print('We need to alert now - visual and audio and tactile (configurable)');
        stopTimer();
      }
    });
  }

  void swapPausePlayButton() {
    setState(() {
      if (_pausePlayIcon == pauseIcon) {
        stopTimer();
        _pausePlayIcon = playIcon;
        _pausePlayTooltip = 'Continue';
      } else {
        startTimer();
        _pausePlayIcon = pauseIcon;
        _pausePlayTooltip = 'Pause';
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final Activity activity = ModalRoute.of(context).settings.arguments;
//    startTimer();
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('Deliberate Practice'),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            Text('Time remaining ${toHHMMSS(_timeRemaining)}.'),
            // TODO add progress bar
            // TODO play alert sound when time is up (and show timer going negative?)
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                IconButton(
                  padding: const EdgeInsets.only(),
                  icon: _pausePlayIcon,
                  tooltip: _pausePlayTooltip,
                  onPressed: () {
                    // TODO pause timer
                    swapPausePlayButton();
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