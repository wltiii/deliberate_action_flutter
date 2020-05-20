import 'dart:convert';

class ExpectationTemplate {
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
    Duration d = Duration(minutes: decoded['allottedDuration']);
    this.allottedDuration = d;
    this.activityTitle = decoded['activityTitle'];
    this.activityHint = decoded['activityHint'];
    this.reflectionQuestions = decoded['reflectionQuestions'];
  }
}



final activity = ExpectationTemplate.fromJson('''{
  "allottedDuration": 10,
  "activityTitle": "What do you plan to accomplish during this session?",
  "activityHint": "Enter your intention.",
  "reflectionQuestions": [
    "What happened during the allotted time?",
    "What explains the difference?",
    "What action can you take to improve outcomes?"
  ]
}''');