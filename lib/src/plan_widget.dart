import 'package:flutter/material.dart';

import 'action_timer_widget.dart';
import 'domain/plan_template.dart';
import 'domain/reflection.dart';
import 'service/plan_service.dart';

class PlanWidget extends StatefulWidget {
  static const routeName = '/expectation';

  PlanWidget({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _Plan createState() => _Plan();
}

class _Plan extends State<PlanWidget> {
  final PlanTemplate _plan = PlanService().get('1');
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
      _plan.allottedDuration += oneMinute;
    });
  }

  void _decrementMinutes() {
    setState(() {
      if (_plan.allottedDuration > oneMinute) {
        _plan.allottedDuration -= oneMinute;
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
                onChanged: (value) {
                  _value = value;
                },
                decoration: InputDecoration(
                    icon: Icon(Icons.subject),
                    labelText: _plan.expectationQuestion,
                    hintText: _plan.hint),
                validator: (value) {
                  if (value.isEmpty) {
                    return 'Please enter what you are planning.';
                  }
                  return null;
                },
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                      'Time allotted to complete action is ${toHHMMSS(_plan.allottedDuration)}.'),
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
                    if (_formKey.currentState.validate()) {
// TODO not sure if i want a snack bar. maybe on reflection page.
                      //                  Scaffold.of(context).showSnackBar(
                      //                      SnackBar(
                      //                          content: Text('Processing Data')
                      //                      )
                      //                  );
                      var args = Reflection.fromPlan(_plan);
                      args.expectation.answer = _value;
                      Navigator.pushNamed(
                        context,
                        ActionTimerWidget.routeName,
                        arguments: args,
                      );
                    }
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
