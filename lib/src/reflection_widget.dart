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
            Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: Text(
                  args.expectation.expectationQuestion,
                  style: TextStyle(fontSize: 14.0, fontWeight: FontWeight.bold),
                )
            ),
            Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: Text(
                args.expectationResponse.answer,
                style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.normal),
              ),
            ),
             Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                "Completed in ${toHHMMSS(args.actualDurationSeconds)}.",
                style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.normal),
              )
            ),
            Column(
              children: args.expectation.reflectionQuestions.map((question) =>
                _buildReflections(question)).toList(),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: IconButton(
                padding: const EdgeInsets.only(),
                icon: Icon(
                  Icons.lens,
                  size: 48.0,
                ),
                tooltip: 'Done',
                onPressed: () {
                  Navigator.popUntil(
                      context, ModalRoute.withName(ExpectationWidget.routeName));
                },
              ),

            ),
          ],
        ),
      ),
    );
  }

  Widget _buildReflections(String question) {
    // TODO should this be a Card, a ListTile, or TextFormField?
    // TODO if ListTile, should it be ListTile.divideTiles?
    // TODO need to capture the input
    return TextFormField(
      keyboardType: TextInputType.multiline,
      maxLines: 3,
//      onChanged: (value){
//        _value = value;
//      },
      decoration: InputDecoration(
          icon: Icon(Icons.subject),
          labelText: question,
//      validator: (value) {
//        if (value.isEmpty) {
//          return 'Enter some text';
//        }
//        return null;
//      },
    )
    );
  }
}
