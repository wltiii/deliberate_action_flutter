import 'package:deliberate_action_flutter/src/reflection_widget.dart';
import 'package:flutter/material.dart';
import 'src/plan_widget.dart';
import 'src/action_timer_widget.dart';
import 'src/reflection_widget.dart';

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
      initialRoute: PlanWidget.routeName,
      routes: {
        PlanWidget.routeName: (context) => PlanWidget(title: appTitle),
        ActionTimerWidget.routeName: (context) => ActionTimerWidget(),
        ReflectionWidget.routeName: (context) => ReflectionWidget(),
      },
    );
  }
}
