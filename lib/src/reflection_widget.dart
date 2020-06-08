import 'package:flutter/material.dart';

import 'domain/reflection.dart';
import 'expectation_widget.dart';

// PostActivity page
// show postActivityHints
// save results (activity, post activity, duration)

class ReflectionWidget extends StatelessWidget {
  static const routeName = '/reflection';
  toHHMMSS(Duration d) => d.toString().split('.').first.padLeft(8, "0");

  @override
  Widget build(BuildContext context) {
    final Reflection args = ModalRoute.of(context).settings.arguments;

    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('Deliberate Practice'),
      ),
      body: Center(
      child: Column(
          children: <Widget>[
            Text(
                args.expectation.expectationQuestion,
                style: TextStyle(fontSize: 14.0, fontWeight: FontWeight.bold),
            ),
            Text(
              args.expectionResponse,
              style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.normal),
            ),
            Text(
              "Completed in ${toHHMMSS(args.actualDurationSeconds)}.",
              style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.normal),
            ),
            IconButton(
              padding: const EdgeInsets.only(),
              icon: Icon(Icons.stop),
              tooltip: 'Done',
              onPressed: () {
                Navigator.popUntil(
                    context, ModalRoute.withName(ExpectationWidget.routeName));
              },
            ),
          ],
        ),
      ),
    );
  }
}
