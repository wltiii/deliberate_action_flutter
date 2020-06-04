import 'package:test/test.dart';
import 'package:deliberate_action_flutter/src/service/reflection-service.dart';


void main() {
  test('gets a template', () {
    final template = new ReflectionService().get('1');

    expect(template.uuid, equals("1"));
    expect(template.actualDuration, equals("test 1"));
    expect(template.reflectionResponses.length, equals(3));
    expect(template.reflectionResponses[0], equals('I came'));
    expect(template.reflectionResponses[1], equals('I saw'));
    expect(template.reflectionResponses[2], equals('I conquered'));
    expect(template.expectation.expectation, equals("What do you plan to accomplish during this session?"));
  });

  test('lists templates', () {
    final templates = new ReflectionService().list('me');

    expect(templates.length, equals(2));
  });

}