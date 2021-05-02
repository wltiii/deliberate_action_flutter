import 'dart:convert';

class PlanTemplate {
  String? id;
  String? name;
  Duration? allottedDuration;
  late String expectationQuestion;
  String? hint;
  List? reflectionQuestions;
  String? userId;
  DateTime? updated;

  // default parameterized constructor
  // see: https://flutterrdart.com/dart-classes-objects-and-constructors-with-examples/
  PlanTemplate(
    this.expectationQuestion,
    this.name,
    this.hint,
    this.allottedDuration,
    this.reflectionQuestions
  );

  // named constructor example
  // see: https://flutterrdart.com/dart-classes-objects-and-constructors-with-examples/
  PlanTemplate.named({
    this.id,
    this.name,
    this.allottedDuration,
    required this.expectationQuestion,
    this.hint,
    this.reflectionQuestions,
  });

  PlanTemplate.fromJson(String json) {
    Map decoded = jsonDecode(json);

    this.id = decoded['uuid'] ?? null;
    this.name = decoded['name'];
    this.allottedDuration =  decoded['allottedDuration'] != null ?
      Duration(minutes: decoded['allottedDuration']) :
      Duration.zero;
    this.expectationQuestion = decoded['expectation'] ?? '';
    this.hint = decoded['hint'];
    this.reflectionQuestions = decoded['reflectionQuestions'];
    this.userId = decoded['userId'];
    this.updated = decoded['updated'] !=  null ?
      DateTime.parse(decoded['updated']) :
      null;
  }
}