import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:deliberate_action_flutter/src/action_timer_widget.dart';

Widget makeTestableWidget(Widget child) {
  return MaterialApp(home: child);
}

void main() {
  testWidgets('tests action timer', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(
        makeTestableWidget(
            ActionTimerWidget(
                title: 'Action Timer',
            )
        )
    );

    // create finders
    final titleFinder = find.text('Action Timer');

    // rebuild widget
    await tester.pumpAndSettle();

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
