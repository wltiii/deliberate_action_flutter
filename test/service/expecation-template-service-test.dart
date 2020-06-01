import 'package:test/test.dart';
import 'package:deliberate_action_flutter/src/domain/expectation-template.dart';
import 'package:deliberate_action_flutter/src/service/expectation-template-service.dart';


void main() {
  test('gets a template', () {
    final template = new ExpectationTemplateService().get('1');

    expect(template.uuid, equals("1"));
    expect(template.activityTitle, equals("What do you plan to accomplish during this session?"));
  });
}