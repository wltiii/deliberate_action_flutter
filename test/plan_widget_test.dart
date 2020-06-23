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
            PlanWidget(title: 'Plan Widget')
        )
    );

    // create finders
    final titleFinder = find.text('Plan Widget');
    final durationFinder = find.text(
        'Time allotted to complete action is 00:10:00.');
    final addButtonFinder = find.byIcon(Icons.add_circle_outline);
    final subtractButtonFinder = find.byIcon(Icons.remove_circle_outline);

    // rebuild widget
//    await tester.pumpAndSettle();

    // verify text widgets appear once
    expect(titleFinder, findsOneWidget);
    expect(durationFinder, findsOneWidget);

//    // Tap the '+' icon and trigger a frame.
    await tester.tap(addButtonFinder);
    await tester.pump();
//    // Verify that our counter has incremented.
    expect(
        find.text('Time allotted to complete action is 00:11:00.'),
        findsOneWidget,
    );
//    // Tap the '-' icon and trigger a frame.
    await tester.tap(subtractButtonFinder);
    await tester.tap(subtractButtonFinder);
    await tester.pump();
    expect(
        find.text('Time allotted to complete action is 00:09:00.'),
        findsOneWidget,
    );

    //TODO add test to verify entry requirement
    //TODO add test to verify transition to new screen
    // Can it validate the arguments passed are as expected? should be able to.
  });
}
