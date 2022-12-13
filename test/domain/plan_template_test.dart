import 'package:deliberate_action_flutter/src/domain/plan_template.dart';
import 'package:test/test.dart';

  void main() {
    var expecationQuestion = 'What is your favorite color?';

    test('instantiates from default constructor', () {
      final template = PlanTemplate(
        expecationQuestion,
        'aTemplate',
        'aHint',
        Duration(minutes:10),
        null,
      );

      expect(template.expectationQuestion, equals(expecationQuestion));
      expect(template.name, equals('aTemplate'));
      expect(template.hint, equals('aHint'));
      expect(template.allottedDuration, equals(Duration(minutes:10)));
      expect(template.reflectionQuestions, equals(null));
    });

    test('instantiates from named constructor', () {
      final template = PlanTemplate.named(
        allottedDuration: Duration(minutes:10),
        expectationQuestion: expecationQuestion,
        hint: 'aHint',
        name: 'aTemplate',
      );

      expect(template.expectationQuestion, equals(expecationQuestion));
      expect(template.name, equals('aTemplate'));
      expect(template.hint, equals('aHint'));
      expect(template.allottedDuration, equals(Duration(minutes:10)));
      expect(template.reflectionQuestions, equals(null));
    });

    test('instantiates from json constructor', () {
      var template = PlanTemplate.fromJson('''{
        "uuid": "1",
        "name": "aTemplate",
        "allottedDuration": 10,
        "expectation": "What is your favorite color?",
        "hint": "Red, green but not blue",
        "reflectionQuestions": [
          "What happened during the allotted time?",
          "What explains the difference?",
          "What action can you take to improve outcomes?"
        ],
        "userId": "42",
        "updated": "1969-07-20 20:18:04Z"
      }''');

      expect(template.id, equals('1'));
      expect(template.name, equals('aTemplate'));
      expect(template.allottedDuration, equals(Duration(minutes:10)));
      expect(template.expectationQuestion, equals(expecationQuestion));
      expect(template.hint, equals('Red, green but not blue'));
      expect(template.reflectionQuestions, equals([
        "What happened during the allotted time?",
        "What explains the difference?",
        "What action can you take to improve outcomes?"
      ]));
      expect(template.userId, equals('42'));
      expect(template.updated, equals(DateTime.parse('1969-07-20 20:18:04Z')));
    });

    test('instantiates from json when missing expectationQuestion', () {
      var jsonString = '''{
        "uuid": "1",
        "name": "aTemplate",
        "allottedDuration": 10,
        "hint": "Red, green but not blue",
        "reflectionQuestions": [
          "What happened during the allotted time?",
          "What explains the difference?",
          "What action can you take to improve outcomes?"
        ],
        "userId": "42",
        "updated": "1969-07-20 20:18:04Z"
      }''';

      var template = PlanTemplate.fromJson(jsonString);

      expect(1, equals(1));
      expect(template.id, equals('1'));
      expect(template.name, equals('aTemplate'));
      expect(template.allottedDuration, equals(Duration(minutes:10)));
      expect(template.expectationQuestion, equals(''));
      expect(template.hint, equals('Red, green but not blue'));
      expect(template.reflectionQuestions, equals([
        "What happened during the allotted time?",
        "What explains the difference?",
        "What action can you take to improve outcomes?"
      ]));
      expect(template.userId, equals('42'));
      expect(template.updated, equals(DateTime.parse('1969-07-20 20:18:04Z')));
    });

    test('instantiates from json when missing all but expectationQuestion', () {
      var jsonString = '''{
        "expectation": "What is your favorite color?"
      }''';

      var template = PlanTemplate.fromJson(jsonString);

      expect(template.id, isNull);
      expect(template.name, isNull);
      expect(template.allottedDuration, equals(Duration.zero));
      expect(template.expectationQuestion, equals(
        'What is your favorite color?'
      ));
      expect(template.hint, isNull);
      expect(template.reflectionQuestions, isNull);
      expect(template.userId, isNull);
      expect(template.updated, isNull);
    });
  }
