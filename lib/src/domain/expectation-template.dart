import 'dart:convert';

class ExpectationTemplate {
  String uuid;
  String name;
  Duration allottedDuration;
  String expectation;
  String hint;
  List reflectionQuestions;

  ExpectationTemplate(
    this.expectation,
    this.name,
    this.hint,
    this.allottedDuration,
    this.reflectionQuestions
  );

  ExpectationTemplate.persisted(
    this.uuid,
    this.expectation,
    this.name,
    this.hint,
    this.allottedDuration,
    this.reflectionQuestions
  );

  ExpectationTemplate.fromJson(String json) {
    Map decoded = jsonDecode(json);
    this.uuid = decoded['uuid'] ?? null;
    this.allottedDuration = Duration(minutes: decoded['allottedDuration']);
    this.name = decoded['name'];
    this.expectation = decoded['expectation'];
    this.hint = decoded['hint'];
    this.reflectionQuestions = decoded['reflectionQuestions'];
  }
}
