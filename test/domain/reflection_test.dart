import 'package:deliberate_action_flutter/src/domain/plan_template.dart';
import 'package:deliberate_action_flutter/src/domain/question_answer.dart';
import 'package:test/test.dart';

import 'package:deliberate_action_flutter/src/domain/reflection.dart';

  void main() {
    test('instantiates from named constructor', () {
      final reflection = Reflection(
        id: '10',
        expectation: QuestionAnswer.named(
          question: "What do you plan to accomplish during this session?",
          answer: "Something wonderful",
        ),
        reflections: [
          QuestionAnswer.named(
            question: "What happened during the allotted time?",
            answer: "My dreams were fulfilled",
          ),
          QuestionAnswer.named(
            question: "What explains the difference?",
            answer: "I gave it a shot",
          ),
          QuestionAnswer.named(
            question: "What action can you take to improve outcomes?",
            answer: "Use deliberate practice to focus on what is important.",
          ),
        ],
        allottedDuration: Duration(seconds: 600),
        actualDurationSeconds: Duration(seconds: 570),
        expectationId: '10',
        name: "test 1",
        userId: 'Per Son',
        updated: DateTime.now(),
      );

      expect(reflection.id, equals("10"));
      expect(reflection.expectation.question,
          equals("What do you plan to accomplish during this session?"));
      expect(reflection.expectation.answer, equals("Something wonderful"));
      expect(reflection.reflections.length, equals(3));
      expect(reflection.reflections[0].question,
          equals("What happened during the allotted time?"));
      expect(reflection.reflections[0].answer,
          equals("My dreams were fulfilled"));
      expect(reflection.reflections[1].question,
          equals("What explains the difference?"));
      expect(reflection.reflections[1].answer, equals("I gave it a shot"));
      expect(reflection.reflections[2].question,
          equals("What action can you take to improve outcomes?"));
      expect(reflection.reflections[2].answer,
          equals("Use deliberate practice to focus on what is important."));
      expect(reflection.allottedDuration, equals(Duration(minutes: 10)));
      expect(reflection.actualDurationSeconds,
          equals(Duration(minutes: 9, seconds: 30)));
      expect(reflection.name, equals("test 1"));
      expect(reflection.expectationId, equals('10'));
      expect(reflection.userId, equals('Per Son'));
      expect(reflection.updated, isNotNull);
    });

    test('instantiates from ExpectationTemplate', () {
      final template = PlanTemplate.fromJson('''{
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
}''');

      final reflection = Reflection.fromPlan(template);


      expect(reflection.id, isNull);
      expect(reflection.userId, isNull);
      expect(reflection.updated, isNull);
      expect(reflection.userId, isNull);
      expect(reflection.updated, isNull);
      expect(reflection.expectation.question,
          equals("What do you plan to accomplish during this session?"));
      expect(reflection.expectation.answer, isNull);
      expect(reflection.reflections.length,
          equals(template.reflectionQuestions.length));
      expect(reflection.reflections[0].question,
          equals("What happened during the allotted time?"));
      expect(reflection.reflections[0].answer, isNull);
      expect(reflection.reflections[1].question,
          equals("What explains the difference?"));
      expect(reflection.reflections[1].answer, isNull);
      expect(reflection.reflections[2].question,
          equals("What action can you take to improve outcomes?"));
      expect(reflection.reflections[2].answer, isNull);
      expect(reflection.allottedDuration, equals(Duration(minutes: 10)));
      expect(reflection.actualDurationSeconds, isNull);
      expect(reflection.name, equals("test 1"));
      expect(reflection.expectationId, equals('1'));
    });

    test('instantiates from json constructor', () {
      final json = ('''{
  "uuid": "10",
  "actualDurationSeconds": 570,
  "expectationResponse": "Do something wonderful",
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
  },
  "userId": "Per Son",
  "updated": "2007-12-01T12:00:00.000Z"
}''');

      final reflection = Reflection.fromJson(json);

      expect(reflection.id, equals("10"));
      expect(reflection.expectation.question,
          equals("What do you plan to accomplish during this session?"));
      expect(reflection.expectation.answer, equals("Do something wonderful"));
      expect(reflection.reflections.length, equals(3));
      expect(reflection.reflections[0].question,
          equals("What happened during the allotted time?"));
      expect(reflection.reflections[0].answer, equals("I came"));
      expect(reflection.reflections[1].question,
          equals("What explains the difference?"));
      expect(reflection.reflections[1].answer, equals("I saw"));
      expect(reflection.reflections[2].question,
          equals("What action can you take to improve outcomes?"));
      expect(reflection.reflections[2].answer, equals("I conquered"));
      expect(reflection.allottedDuration, equals(Duration(minutes: 10)));
      expect(reflection.actualDurationSeconds,
          equals(Duration(minutes: 9, seconds: 30)));
      expect(reflection.name, equals("test 1"));
      expect(reflection.expectationId, equals('1'));
      expect(reflection.userId, equals('Per Son'));
      expect(reflection.updated,
          equals(DateTime.parse("2007-12-01T12:00:00.000Z")));
    });

  }