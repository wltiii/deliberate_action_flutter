import 'package:deliberate_action_flutter/src/domain/screen-arguments.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import 'reflection.dart';
import 'domain/expectation-template.dart';

// stopwatch page
// shows progress bar with time remaining
// alarm when time ends
// silence alarm and continue (encourages wrong behavior - think carefully)

class ActionTimerWidget extends StatefulWidget {
  static const routeName = '/action-timer';
  const ActionTimerWidget({
    Key key,
    this.title,
  }) : super(key: key);


  final String title;
  _ActionTimer createState() => _ActionTimer();
}

class _ActionTimer extends State<ActionTimerWidget> {
  Timer _timer;
  Duration _timeRemaining;
  Duration timeout = const Duration(seconds: 1);
  Icon pauseIcon = const Icon(Icons.pause_circle_outline);
  Icon playIcon = const Icon(Icons.play_circle_outline);
  Icon _pausePlayIcon;
  String _pausePlayTooltip;
// SEE: for below  https://trello.com/invite/b/Le8rQr0e/d3c07089afd1b451dc1681becfb2d47a/deliberate-action
  // TODO: these two functions look like they will be used in multiple locations. Consider moving to another class.
  toHHMMSS(Duration d) => d.toString().split('.').first.padLeft(8, "0");
  toMMSS(Duration d) => d.toString().substring(2, 7);

  @override
  void initState() {
    startTimer();
    //_timeRemaining = activity.allottedDuration;
    //_timeRemaining = args._activity.allottedDuration;
    _pausePlayIcon = pauseIcon;
    _pausePlayTooltip = 'Pause';
    super.initState();
  }

  startTimer() {
    _timer = new Timer.periodic(timeout, handleTimerEvent);
  }

  void stopTimer() {
    _timer.cancel();
  }

  void handleTimerEvent(Timer timer) {
    setState(() {
      _timeRemaining = _timeRemaining - timeout;
      if (_timeRemaining.inMilliseconds == 0) {
        print(
            'We need to alert now - visual and audio and tactile (configurable)');
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
    // TODO will this be necessary when data is read from file by Home?
    final ScreenArguments args = ModalRoute.of(context).settings.arguments;
    _timeRemaining = args.expectationTemplate.allottedDuration;
//    startTimer();
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('Deliberate Practice'),
      ),
      body: Center(
          child: Column(children: <Widget>[
        Text('Time remaining ${toHHMMSS(_timeRemaining)}.'),
            Text(args.expectation),
        // TODO add progress bar
        // TODO play alert sound when time is up (and show timer going negative?)
        Row(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
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
              Navigator.pushNamed(context, Reflection.routeName);
            },
          ),
        ]),
      ])),
    );
  }
}
