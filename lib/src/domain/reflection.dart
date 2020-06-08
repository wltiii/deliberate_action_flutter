import 'dart:convert';

import 'expectation_template.dart';
import 'question_answer.dart';

class Reflection {
  String uuid;
  Duration actualDurationSeconds;
  QuestionAnswer expectationResponse;
  List reflectionResponses;
  ExpectationTemplate expectation;
  DateTime updated;

  // default constructor using named arguments
  // see: https://flutterigniter.com/deconstructing-dart-constructors/
  Reflection({
    this.uuid,
    this.expectationResponse,
    this.actualDurationSeconds,
    this.reflectionResponses,
    this.expectation,
  });

  Reflection.fromJson(String json) {
    Map decoded = jsonDecode(json);
    this.uuid = decoded['uuid'] ?? null;
    this.actualDurationSeconds = Duration(seconds: decoded['actualDurationSeconds']);
    this.reflectionResponses = decoded['reflectionResponses'];
    this.expectationResponse = QuestionAnswer.named(
      question: decoded['expectation']['expectation'],
      answer: decoded['expectationResponse'],
    );

    this.expectation = ExpectationTemplate.named(
      uuid: decoded['expectation']['uuid'],
      expectationQuestion: decoded['expectation']['expectation'],
      name: decoded['expectation']['name'],
      hint: decoded['expectation']['hint'],
      allottedDuration: Duration(minutes: decoded['expectation']['allottedDuration']),
      reflectionQuestions: decoded['expectation']['reflectionQuestions'],
    );
  }
}
