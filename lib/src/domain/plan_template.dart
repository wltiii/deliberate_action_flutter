import 'dart:convert';

class PlanTemplate {
  String id;
  String name;
  Duration allottedDuration;
  String expectationQuestion;
  String hint;
  List reflectionQuestions;
  String userId;
  DateTime updated;

  // default parameterized constructor
  // see: https://flutterrdart.com/dart-classes-objects-and-constructors-with-examples/
  // TODO use factory constructor?
  PlanTemplate(
    this.expectationQuestion,
    this.name,
    this.hint,
    this.allottedDuration,
    this.reflectionQuestions
  );

  // TODO it seems effective style or such suggested doing this differently
  // TODO if going to have a named constructor, perhaps it should be the other?
  PlanTemplate.named({
    this.id,
    this.name,
    this.allottedDuration,
    this.expectationQuestion,
    this.hint,
    this.reflectionQuestions,
  });

  PlanTemplate.fromJson(String json) {
    Map decoded = jsonDecode(json);
    this.id = decoded['uuid'] ?? null;
    this.allottedDuration = Duration(minutes: decoded['allottedDuration']);
    this.name = decoded['name'];
    this.expectationQuestion = decoded['expectation'];
    this.hint = decoded['hint'];
    this.reflectionQuestions = decoded['reflectionQuestions'];
  }
}
