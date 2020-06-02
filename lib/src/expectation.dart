import 'package:flutter/material.dart';
import 'domain/expectation-template.dart';
import 'package:deliberate_action_flutter/src/service/expectation-template-service.dart';
import 'domain/screen-arguments.dart';
import 'action-timer-widget.dart';

class Expectation extends StatefulWidget {
  static const routeName = '/expectation';
  Expectation({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _Expectation createState() => _Expectation();
}

class _Expectation extends State<Expectation> {
  ExpectationTemplate _expectation = new ExpectationTemplateService().get('1');
  final _formKey = GlobalKey<FormState>();
  Duration oneMinute = const Duration(minutes: 1);
  String _value;
  ScreenArguments sa;

  toHHMMSS(Duration d) => d.toString().split('.').first.padLeft(8, "0");

  @override
  void initState() {
    super.initState();
  }

  void _incrementMinutes() {
    setState(() {
      _expectation.allottedDuration += oneMinute;
    });
  }

  void _decrementMinutes() {
    setState(() {
      if (_expectation.allottedDuration > oneMinute) {
        _expectation.allottedDuration -= oneMinute;
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
                onChanged: (value){
                  _value = value;
                  print(_value);
                },
                decoration: InputDecoration(
                    icon: Icon(Icons.subject),
                    labelText: _expectation.activityTitle,
                    hintText: _expectation.activityHint),
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
                  Text(
                      'Time allotted to complete action is ${toHHMMSS(_expectation.allottedDuration)}.'),
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
//                _activity.allottedDuration = _allottedDuration;
                    Navigator.pushNamed(context, ActionTimerWidget.routeName,
                        arguments: new ScreenArguments(_expectation, _value));
// TODO SnackBar belongs on clock page but may be used here for errors
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
