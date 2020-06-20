import 'dart:async';

import 'package:flutter/material.dart';

import 'domain/reflection.dart';
import 'reflection_widget.dart';

// shows progress bar with time remaining
// alarm when time ends

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
  bool _initialized = false;
  Timer _timer;
  Duration _timeRemaining;
  final Duration _timeout = const Duration(seconds: 1);
  Icon pauseIcon = const Icon(Icons.pause_circle_outline);
  Icon playIcon = const Icon(Icons.play_circle_outline);
  Icon _pausePlayIcon;
  String _pausePlayTooltip;
  // TODO: these two functions look like they will be used in multiple 
  //  locations. Consider moving to another class.
  _toHHMMSS(Duration d) => d.toString().split('.').first.padLeft(8, "0");
  _toMMSS(Duration d) => d.toString().substring(2, 7);

  @override
  void initState() {
    _startTimer();
    _pausePlayIcon = pauseIcon;
    _pausePlayTooltip = 'Pause';
    super.initState();
  }

  _startTimer() => _timer = Timer.periodic(_timeout, handleTimerEvent);

  _stopTimer() => _timer.cancel();

  void handleTimerEvent(Timer timer) {
    setState(() {
      _timeRemaining = _timeRemaining - _timeout;
      if (_timeRemaining.inMilliseconds == 0) {
        print(
          'ALERT NOW - visual and audio and tactile (configurable)');
        _stopTimer();
      }
    });
  }

  void swapPausePlayButton() {
    setState(() {
      if (_pausePlayIcon == pauseIcon) {
        _stopTimer();
        _pausePlayIcon = playIcon;
        _pausePlayTooltip = 'Continue';
      } else {
        _startTimer();
        _pausePlayIcon = pauseIcon;
        _pausePlayTooltip = 'Pause';
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final Reflection _args = ModalRoute.of(context).settings.arguments;

    // TODO this seems wrong. Can it be initialized without this method?
    _initFromArgs(_args);

    return Scaffold(
      appBar: AppBar(
        title: Text('Deliberate Practice'),
      ),
      body: Center(
          child: Column(children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: Text(
                _args.expectation.question,
                style: TextStyle(fontSize: 14.0, fontWeight: FontWeight.normal),
              )
            ),
            Padding(
              padding: const EdgeInsets.all(24.0),
              child: Text(
                _args.expectation.answer,
                style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
              ),
            ),
            Padding(
                padding: const EdgeInsets.all(16.0),
              child: Text(
                'Time remaining ${_toHHMMSS(_timeRemaining)}.',
                style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.normal),
              ),
            ),
            // TODO add progress bar
        // TODO play alert when time is up (and show timer going negative?)
        Row(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
          IconButton(
            padding: const EdgeInsets.only(),
            icon: _pausePlayIcon,
            tooltip: _pausePlayTooltip,
            onPressed: swapPausePlayButton,
          ),
          IconButton(
            padding: const EdgeInsets.only(),
            icon: Icon(Icons.stop),
            tooltip: 'Stop',
            onPressed: () {
              _stopTimer();
                  _args.actualDurationSeconds = _timeRemaining;
              Navigator.pushNamed(
                  context,
                  ReflectionWidget.routeName,
                  arguments: _args,
              );
            },
          ),
        ]),
      ])),
    );
  }

  _initFromArgs(Reflection args) {
    if (!_initialized) {
      _timeRemaining = args.allottedDuration;
      _initialized = true;
    }
  }
}
