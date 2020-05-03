import 'package:flutter/material.dart';
import 'home.dart';

// PostActivity page
// show postActivityHints
// save results (activity, post activity, duration)

class Analysis extends StatelessWidget{
  static const routeName = '/analysis';

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('Deliberate Practice'),
      ),
      body: Center(
        child:  IconButton(
          padding: const EdgeInsets.only(),
          icon: Icon(Icons.lens),
          tooltip: 'Done',
          onPressed: () {
            Navigator.popUntil(context, ModalRoute.withName(Home.routeName));
          },
        ),
      ),
    );
  }
}