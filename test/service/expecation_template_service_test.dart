import 'package:test/test.dart';
import 'package:deliberate_action_flutter/src/service/expectation_template_service.dart';


void main() {
  test('gets a template', () {
    final template = new ExpectationTemplateService().get('1');

    expect(template.uuid, equals("1"));
    expect(template.expectationQuestion, equals("What do you plan to accomplish during this session?"));
    expect(template.name, equals("test 1"));
  });

  test('lists templates', () {
    final templates = new ExpectationTemplateService().list('me');

    expect(templates.length, equals(2));
  });

}