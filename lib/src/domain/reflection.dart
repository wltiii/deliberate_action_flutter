import 'dart:convert';

import 'expectation_template.dart';

class Reflection {
  String uuid;
  Duration actualDurationSeconds;
  String expectionResponse;
  List reflectionResponses;
  ExpectationTemplate expectation;
  DateTime updated;

  // default constructor using named arguments
  // see: https://flutterigniter.com/deconstructing-dart-constructors/
  Reflection({
    this.uuid,
    this.expectionResponse,
    this.actualDurationSeconds,
    this.reflectionResponses,
    this.expectation,
  });

  Reflection.fromJson(String json) {
    Map decoded = jsonDecode(json);
    this.uuid = decoded['uuid'] ?? null;
    this.actualDurationSeconds = Duration(seconds: decoded['actualDurationSeconds']);
    this.reflectionResponses = decoded['reflectionResponses'];

    this.expectation = ExpectationTemplate.persisted(
    decoded['expectation']['uuid'],
    decoded['expectation']['expectation'],
    decoded['expectation']['name'],
    decoded['expectation']['hint'],
    Duration(minutes: decoded['expectation']['allottedDuration']),
    decoded['expectation']['reflectionQuestions'],
    );
  }
}
