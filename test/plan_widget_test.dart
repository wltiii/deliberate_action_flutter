import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:deliberate_action_flutter/src/plan_widget.dart';

// TODO are either of these two options superior? The latter is simpler
// for sources for these two methods
// SEE: https://stackoverflow.com/questions/55695910/testing-in-flutter-gives-error-mediaquery-of-called-with-a-context-that-does-n
// SEE: https://stackoverflow.com/questions/48498709/widget-test-fails-with-no-mediaquery-widget-found
// TODO discuss with Richard
// TODO take in feedback on my posts on the above SOs.
Widget buildTestableWidget(Widget widget) => MediaQuery(
    data: MediaQueryData(),
    child: MaterialApp(home: widget)
);

Widget makeTestableWidget(Widget child) {
  return MaterialApp(home: child);
}

void main() {
  testWidgets('tests plan widget', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(
        makeTestableWidget(
            PlanWidget(title: 'Test title')
        )
    );

    // create finders
    final titleFinder = find.text('Test title');

    // rebuild widget
//    await tester.pumpAndSettle();

    // verify text widgets appear once
    expect(titleFinder, findsOneWidget);

//    // Verify that our counter starts at 0.
//    expect(find.text('0'), findsOneWidget);
//    expect(find.text('1'), findsNothing);
//
//    // Tap the '+' icon and trigger a frame.
//    await tester.tap(find.byIcon(Icons.add));
//    await tester.pump();
//
//    // Verify that our counter has incremented.
//    expect(find.text('0'), findsNothing);
//    expect(find.text('1'), findsOneWidget);
  });
}
