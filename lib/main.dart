import 'package:deliberate_action_flutter/src/analysis.dart';
import 'package:flutter/material.dart';
import 'src/home.dart';
import 'src/stopwatch.dart';
import 'src/analysis.dart';

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
      initialRoute: Home.routeName,
      routes: {
        // When navigating to the "/" route, build the FirstScreen widget.
        Home.routeName: (context) => Home(title: appTitle),
        // When navigating to the "/second" route, build the SecondScreen widget.
        Stopwatch.routeName: (context) => Stopwatch(),
        Analysis.routeName: (context) => Analysis(),
      },
    );
  }
}
