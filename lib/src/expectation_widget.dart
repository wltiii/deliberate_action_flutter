import 'package:flutter/material.dart';

import 'action_timer_widget.dart';
import 'domain/expectation_template.dart';
import 'domain/question_answer.dart';
import 'domain/reflection.dart';
import 'service/expectation_template_service.dart';

class ExpectationWidget extends StatefulWidget {
  static const routeName = '/expectation';
  ExpectationWidget({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _Expectation createState() => _Expectation();
}

class _Expectation extends State<ExpectationWidget> {
  ExpectationTemplate _expectation = new ExpectationTemplateService().get('1');
  Reflection _reflection;
  final _formKey = GlobalKey<FormState>();
  Duration oneMinute = const Duration(minutes: 1);
  String _value;

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
                },
                decoration: InputDecoration(
                    icon: Icon(Icons.subject),
                    labelText: _expectation.expectationQuestion,
                    hintText: _expectation.hint),
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
                    var args = Reflection.fromExpectationTemplate(_expectation);
                    args.expectation.answer = _value;
                    Navigator.pushNamed(
                        context,
                        ActionTimerWidget.routeName,
                        arguments: args,
                    );
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
