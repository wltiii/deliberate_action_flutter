import 'package:deliberate_action_flutter/src/reflection.dart';
import 'package:flutter/material.dart';
import 'src/expectation.dart';
import 'src/action-timer.dart';
import 'src/reflection.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.

  @override
  Widget build(BuildContext context) {
    final appTitle = 'Deliberate Practice';

    return MaterialApp(
      title: appTitle,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
//      home: ActionInitForm(title: appTitle),
      initialRoute: Expectation.routeName,
      routes: {
        // When navigating to the "/" route, build the FirstScreen widget.
        Expectation.routeName: (context) => Expectation(title: appTitle),
        // When navigating to the "/second" route, build the SecondScreen widget.
        ActionTimer.routeName: (context) => ActionTimer(),
        Reflection.routeName: (context) => Reflection(),
      },
    );
  }
}
