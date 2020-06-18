import 'package:test/test.dart';
import 'package:deliberate_action_flutter/src/service/plan_service.dart';


void main() {
  test('gets a template', () {
    final template = new PlanService().get('1');

    expect(template.id, equals("1"));
    expect(template.expectationQuestion,
        equals("What do you plan to accomplish during this session?"));
    expect(template.name, equals("test 1"));
  });

  test('lists templates', () {
    final templates = PlanService().list('me');

    expect(templates.length, equals(2));
  });

}