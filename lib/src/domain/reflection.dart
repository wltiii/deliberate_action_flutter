import 'dart:convert';
import 'package:deliberate_action_flutter/src/domain/expectation-template.dart';

class Reflection {
  String uuid;
  Duration actualDuration;
  List reflectionResponses;
  ExpectationTemplate expectation;

  Reflection({
    this.uuid,
    this.actualDuration,
    this.reflectionResponses,
    this.expectation,
  });

  Reflection.fromJson(String json) {
    Map decoded = jsonDecode(json);
    this.uuid = decoded['uuid'] ?? null;
    this.actualDuration = Duration(minutes: decoded['actualDuration']);
    this.reflectionResponses = decoded['reflectionResponses'];

    this.expectation.uuid = decoded['uuid'] ?? null;
    this.expectation.allottedDuration = Duration(minutes: decoded['allottedDuration']);
    this.expectation.name = decoded['name'];
    this.expectation.expectation = decoded['expectation'];
    this.expectation.hint = decoded['hint'];
    this.expectation.reflectionQuestions = decoded['reflectionQuestions'];
  }
}
