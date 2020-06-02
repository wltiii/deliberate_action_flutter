import 'package:deliberate_action_flutter/src/domain/expectation-template.dart';

class ExpectationTemplateService {

  final template1 = ExpectationTemplate.fromJson('''{
  "uuid": "1",
  "allottedDuration": 10,
  "activityTitle": "What do you plan to accomplish during this session?",
  "activityHint": "Enter your intention.",
  "reflectionQuestions": [
    "What happened during the allotted time?",
    "What explains the difference?",
    "What action can you take to improve outcomes?"
  ]
}''');

  final template2 = ExpectationTemplate.fromJson('''{
  "uuid": "2",
  "allottedDuration": 45,
  "activityTitle": "How long will you run?",
  "activityHint": "Enter your intention.",
  "reflectionQuestions": [
    "Did you run the expected distance within your allotted time?",
    "What explains the difference?",
    "What action can you take to improve outcomes?"
  ]
}''');

  ExpectationTemplate get(String uuid) {
    return stubResponse(uuid);
  }

  List<ExpectationTemplate> list(String user) {
    return [template1, template2];
  }

  ExpectationTemplate stubResponse(String uuid) {
    if (uuid == "1") {
      return template1;
    }
    if (uuid == "2") {
      return template2;
    }
    return null;
  }




}