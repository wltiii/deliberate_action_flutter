import 'package:deliberate_action_flutter/src/domain/reflection.dart';

class ReflectionService {

  final reflection1 = Reflection.fromJson('''{
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

  final reflection2 = Reflection.fromJson('''{
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

  Reflection get(String uuid) {
    return stubResponse(uuid);
  }

  List<Reflection> list(String user) {
    return [reflection1, reflection2];
  }

  Reflection stubResponse(String uuid) {
    if (uuid == "1") {
      return reflection1;
    }
    if (uuid == "2") {
      return reflection2;
    }
    return null;
  }
}