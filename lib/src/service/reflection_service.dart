import 'package:uuid/uuid.dart';

import '../domain/reflection.dart';

class ReflectionService {

  final reflection1 = Reflection.fromJson('''{
  "uuid": "10",
  "actualDurationSeconds": 570,
  "reflectionResponses": [
    "I came",
    "I saw",
    "I conquered"
  ],
  "expectation": {
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
  },
  "updated": "2007-12-01T12:00:00.000Z"
}''');

  final reflection2 = Reflection.fromJson('''{
  "uuid": "20",
  "actualDurationSeconds": 607,
  "reflectionResponses": [
    "I came",
    "I saw",
    "I conquered"
  ],
  "expectation": {
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
  },
  "updated": "2014-05-31T12:00:00.000Z"
}''');

  Reflection get(String uuid) {
    return stubGetResponse(uuid);
  }

  List<Reflection> list(String user) {
    return [reflection1, reflection2];
  }

  Reflection save(Reflection reflection) {
    if (reflection.uuid == null) {
      return _stubPostResponse(reflection);
    }
//    return stubPutResponse(reflection);
  return null;
  }

  Reflection stubGetResponse(String uuid) {
    if (uuid == "10") {
      return reflection1;
    }
    if (uuid == "20") {
      return reflection2;
    }
    return null;
  }

  Reflection _stubPostResponse(Reflection reflection) {
    reflection.uuid = Uuid().v4();
  }
}