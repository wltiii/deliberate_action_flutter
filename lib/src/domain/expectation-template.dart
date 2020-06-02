import 'dart:convert';
import 'package:uuid/uuid_util.dart';

class ExpectationTemplate {
  String uuid;
  Duration allottedDuration;
  String activityTitle;
  String activityHint;
  List reflectionQuestions;

  ExpectationTemplate(
    this.activityTitle,
    this.activityHint,
    this.allottedDuration,
    this.reflectionQuestions
  );

  ExpectationTemplate.fromJson(String json) {
    Map decoded = jsonDecode(json);
    this.uuid = decoded['uuid'] ?? null;
    this.allottedDuration = Duration(minutes: decoded['allottedDuration']);
    this.activityTitle = decoded['activityTitle'];
    this.activityHint = decoded['activityHint'];
    this.reflectionQuestions = decoded['reflectionQuestions'];
  }
}
