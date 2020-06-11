import 'dart:convert';

import 'expectation_template.dart';
import 'question_answer.dart';

class Reflection {
  String id;
  QuestionAnswer expectation;
  List<QuestionAnswer> reflections;
  // TODO remove reflection responses
  List reflectionResponses;
  Duration allottedDuration;
  Duration actualDurationSeconds;
  ExpectationTemplate expectationTemplate;
  // TODO what happens if the expecation is changed?
  // TODO What about searching? Wouldn't it be by name?
  String expectationId;
  String userId;
  DateTime updated;

  // default constructor using named arguments
  // see: https://flutterigniter.com/deconstructing-dart-constructors/
  // TODO update constructors
  Reflection({
    this.id,
    this.expectation,
    this.allottedDuration,
    this.actualDurationSeconds,
    this.reflectionResponses,
    this.reflections,
    this.expectationTemplate,
  });

  Reflection.fromJson(String json) {
    Map decoded = jsonDecode(json);
    this.id = decoded['uuid'] ?? null;
    this.actualDurationSeconds = Duration(seconds: decoded['actualDurationSeconds']);
    this.reflectionResponses = decoded['reflectionResponses'];
    this.expectation = QuestionAnswer.named(
      question: decoded['expectation']['expectation'],
      answer: decoded['expectationResponse'],
    );

    this.expectationTemplate = ExpectationTemplate.named(
      id: decoded['expectation']['uuid'],
      expectationQuestion: decoded['expectation']['expectation'],
      name: decoded['expectation']['name'],
      hint: decoded['expectation']['hint'],
      allottedDuration: Duration(minutes: decoded['expectation']['allottedDuration']),
      reflectionQuestions: decoded['expectation']['reflectionQuestions'],
    );
  }
}
