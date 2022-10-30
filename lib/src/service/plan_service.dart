import '../domain/plan_template.dart';

class PlanService {
  final template1 = PlanTemplate.fromJson('''{
  "uuid": "1",
  "name": "test 1",
  "allottedDuration": 10,
  "expectation": "What do you plan to accomplish during this session?",
  "hint": "Enter your intention.",
  "reflectionQuestions": [
    "What happened during the allotted time?",
    "What explains the difference?",
    "What action can you take to improve outcomes?"
  ]
}''');

  final template2 = PlanTemplate.fromJson('''{
  "uuid": "2",
  "name": "test 2",
  "allottedDuration": 45,
  "expectation": "How long will you run?",
  "hint": "Enter your intention.",
  "reflectionQuestions": [
    "Did you run the expected distance within your allotted time?",
    "What explains the difference?",
    "What action can you take to improve outcomes?"
  ]
}''');

  final template3 = PlanTemplate.fromJson('''{
  "uuid": "3",
  "name": "test 3",
  "allottedDuration": 1,
  "expectation": "What do you expect to do with so little time?",
  "hint": "Enter your intention.",
  "reflectionQuestions": [
    "Was it completed?",
    "What explains the difference?",
    "What action can you take to improve outcomes?"
  ]
}''');

  PlanTemplate get(String uuid) {
    return stubResponse(uuid);
  }

  List<PlanTemplate> list(String user) {
    return [template1, template2];
  }

  // this is a stub (of course) - with Not Null By Default, I
  // am approaching this by making _invalid states unrepresentable_.
  // Therefor, this will return a valid object *always*.
  PlanTemplate stubResponse(String uuid) {
    if (uuid == "1") {
      return template1;
    }
    if (uuid == "2") {
      return template2;
    }
    if (uuid == "3") {
      return template3;
    }
    return template1;
  }
}
