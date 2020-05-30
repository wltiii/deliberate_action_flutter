import 'package:deliberate_action_flutter/src/reflection.dart';
import 'package:flutter/material.dart';
import 'src/expectation.dart';
import 'src/action-timer-widget.dart';
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
      initialRoute: Expectation.routeName,
      routes: {
        Expectation.routeName: (context) => Expectation(title: appTitle),
        ActionTimerWidget.routeName: (context) => ActionTimerWidget(),
        Reflection.routeName: (context) => Reflection(),
      },
    );
  }
}
