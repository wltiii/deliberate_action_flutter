import 'package:deliberate_action_flutter/src/reflection-widget.dart';
import 'package:flutter/material.dart';
import 'src/expectation-widget.dart';
import 'src/action-timer-widget.dart';
import 'src/reflection-widget.dart';

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
      initialRoute: ExpectationWidget.routeName,
      routes: {
        ExpectationWidget.routeName: (context) => ExpectationWidget(title: appTitle),
        ActionTimerWidget.routeName: (context) => ActionTimerWidget(),
        ReflectionWidget.routeName: (context) => ReflectionWidget(),
      },
    );
  }
}
