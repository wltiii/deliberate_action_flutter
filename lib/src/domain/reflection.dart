import 'dart:convert';

import 'plan_template.dart';
import 'question_answer.dart';

class Reflection {
  String? id;
  QuestionAnswer? expectation;
  List<QuestionAnswer>? reflections;
  Duration? allottedDuration;
  Duration? actualDurationSeconds;
  // TODO what happens if the expectation template changes?
  //  TODO i.e. reflections, etc. might possibly not align
  // TODO What about searching? Wouldn't it be by name?
//  ExpectationTemplate expectationTemplate;
  String? name;
  String? expectationId;
  String? userId;
  DateTime? updated;

  // default constructor using named arguments
  // see: https://flutterigniter.com/deconstructing-dart-constructors/
  Reflection({
    this.id,
    this.expectation,
    this.reflections,
    this.allottedDuration,
    this.actualDurationSeconds,
    this.name,
    this.expectationId,
    this.userId,
    this.updated,
  });

  Reflection.fromPlan(PlanTemplate template) {
    expectation = QuestionAnswer.withQuestion(template.expectationQuestion);
    // TODO can reflections be instantiated in a one-liner?
    reflections = [];
    template.reflectionQuestions!.forEach((reflection) {
      reflections!.add(QuestionAnswer.withQuestion(reflection));
    });
    allottedDuration = template.allottedDuration;
    name = template.name;
    expectationId = template.id;
  }

  Reflection.fromJson(String json) {
    Map decoded = jsonDecode(json);
    this.id = decoded['uuid'] ?? null;
    this.actualDurationSeconds =
        Duration(seconds: decoded['actualDurationSeconds']);
    this.expectation = QuestionAnswer.named(
      question: decoded['expectation']['expectation'],
      answer: decoded['expectationResponse'],
    );

    reflections = [];
    decoded['expectation']['reflectionQuestions'].forEach((question) {
      reflections!.add(QuestionAnswer.withQuestion(question));
    });

    List? responses = decoded['reflectionResponses'];
    for(var i = 0; i < reflections!.length; i++) {
      reflections![i].answer = i < reflections!.length ? responses![i] : null;
    }

    allottedDuration =
        Duration(minutes: decoded['expectation']['allottedDuration']);

    name = decoded['expectation']['name'];
    expectationId = decoded['expectation']['uuid'];
    userId = decoded['userId'];
    updated = DateTime.parse(decoded['updated']);
  }
}
