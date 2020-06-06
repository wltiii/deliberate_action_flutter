import 'package:deliberate_action_flutter/src/domain/reflection.dart';
import 'package:test/test.dart';
import 'package:deliberate_action_flutter/src/service/reflection_service.dart';


void main() {
  test('gets a reflection', () {
    final reflection = ReflectionService().get('10');

    expect(reflection.uuid, equals("10"));
    expect(reflection.actualDurationSeconds, equals(Duration(minutes: 9, seconds: 30)));
    expect(reflection.reflectionResponses.length, equals(3));
    expect(reflection.reflectionResponses[0], equals('I came'));
    expect(reflection.reflectionResponses[1], equals('I saw'));
    expect(reflection.reflectionResponses[2], equals('I conquered'));
    expect(reflection.expectation.expectation, equals("What do you plan to accomplish during this session?"));
  });

  test('lists reflections', () {
    final reflection = ReflectionService().list('me');

    expect(reflection.length, equals(2));
  });

  test('saves a new reflection', () {
    final reflection = Reflection.fromJson('''{
  "actualDurationSeconds": 570,
  "reflectionResponses": [
    "I came",
    "I saw",
    "I conquered"
  ],
  "expectation": {
    "uuid": "1",
    "name": "test 1",
    "allottedDuration": 10,
    "expectation": "What do you plan to accomplish during this session?",
    "hint": "Enter your intention.",
    "reflectionQuestions": [
      "What happened during the allotted time?",
      "What explains the difference?",
      "What action can you take to improve outcomes?"
    ]
  }
}''');

    var before = DateTime.now();
    final result = ReflectionService().save(reflection);
    var after = DateTime.now();

    expect(result, isNotNull);
    expect(result.uuid, isNotNull);
    expect(result.updated, allOf(
        greaterThanOrEqualTo(before),
        lessThanOrEqualTo(after)
    ));
  });

}