import 'package:flutter/material.dart';
import 'domain/activity.dart';
import 'activity-clock.dart';

class Home extends StatefulWidget {
  static const routeName = '/home';
  Home({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _Home createState() => _Home();
}

class _Home extends State<Home> {
  Activity _activity = activity;
  final _formKey = GlobalKey<FormState>();
  // TODO set _actionMinutes to allottedDuration (or a default?)
//  int _actionMinutes = _activity.allottedDuration;
  int _actionMinutes = 10;


  void _incrementMinutes() {
    setState(() {
      _actionMinutes += 1;
    });
  }

  void _decrementMinutes() {
    setState(() {
      if (_actionMinutes > 1) {
        _actionMinutes -= 1;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Scaffold(
        appBar: AppBar(title: Text(widget.title)),
        body: Center(
          child: Column(
//            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              TextFormField(
                keyboardType: TextInputType.multiline,
                maxLines: 3,
                decoration: InputDecoration(
                  icon: Icon(Icons.subject),
                  labelText: _activity.activityTitle,
                  hintText: _activity.activityHint
                ),
                validator: (value) {
                  if (value.isEmpty) {
                    return 'Enter some text';
                  }
                  return null;
                },
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text('To be completed in $_actionMinutes minutes.'),
                  IconButton(
                    padding: const EdgeInsets.only(),
                    icon: Icon(Icons.add_circle_outline),
                    tooltip: 'Increase time allotted to activity.',
                    onPressed: _incrementMinutes,
                  ),
                  IconButton(
                    padding: const EdgeInsets.only(),
                    icon: Icon(Icons.remove_circle_outline),
                    tooltip: 'Decrease time allotted to activity.',
                    onPressed: _decrementMinutes,
                  ),
                ],
              ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: RaisedButton(
              onPressed: () {
                _activity.allottedDuration = _actionMinutes;
                Navigator.pushNamed(
                  context,
                  ActivityClock.routeName,
                  arguments: _activity
                );
//                if (_formKey.currentState.validate()) {
//                  Scaffold.of(context).showSnackBar(
//                      SnackBar(
//                          content: Text('Processing Data')
//                      )
//                  );
//                }
              },
              child: Text('Start Activity'),
            ),
          ),

          ],
          ),
        ),
      ),
    );
  }
}