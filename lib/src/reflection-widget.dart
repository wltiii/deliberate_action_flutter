import 'package:flutter/material.dart';
import 'domain/screen_arguments.dart';
import 'expectation-widget.dart';

// PostActivity page
// show postActivityHints
// save results (activity, post activity, duration)

class ReflectionWidget extends StatelessWidget {
  static const routeName = '/reflection';

  @override
  Widget build(BuildContext context) {
    final ScreenArguments args = ModalRoute.of(context).settings.arguments;
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('Deliberate Practice'),
      ),
      body: Center(
      child: Column(
          children: <Widget>[
            Text(args.expectationTemplate.expectation),
            IconButton(
              padding: const EdgeInsets.only(),
              icon: Icon(Icons.lens),
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
