import 'package:deliberate_action_flutter/src/domain/expectation-template.dart';

class ExpectationTemplateService {

  final template = ExpectationTemplate.fromJson('''{
  "allottedDuration": 10,
  "activityTitle": "What do you plan to accomplish during this session?",
  "activityHint": "Enter your intention.",
  "reflectionQuestions": [
    "What happened during the allotted time?",
    "What explains the difference?",
    "What action can you take to improve outcomes?"
  ]
}''');

  ExpectationTemplate get(String uuid) {
    return template;
  }

}