import 'package:test/test.dart';
import 'package:deliberate_action_flutter/src/service/reflection-service.dart';


void main() {
  test('gets a reflection', () {
    final reflection = new ReflectionService().get('10');

    expect(reflection.uuid, equals("10"));
    expect(reflection.actualDurationSeconds, equals(Duration(minutes: 9, seconds: 30)));
    expect(reflection.reflectionResponses.length, equals(3));
    expect(reflection.reflectionResponses[0], equals('I came'));
    expect(reflection.reflectionResponses[1], equals('I saw'));
    expect(reflection.reflectionResponses[2], equals('I conquered'));
    expect(reflection.expectation.expectation, equals("What do you plan to accomplish during this session?"));
  });

  test('lists reflections', () {
    final reflection = new ReflectionService().list('me');

    expect(reflection.length, equals(2));
  });

//  test('saves a reflection', () {
//    final reflection = new ReflectionService().put('me');
//
//    expect(reflection.uuid, isNotNull);
//    expect(reflection.length, equals(2));
//  });

}