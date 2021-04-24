import 'package:deliberate_action_flutter/src/domain/question_answer.dart';
import 'package:test/test.dart';

  void main() {
    test('instantiates from default constructor', () {
      final qa = QuestionAnswer(
          'What is your favorite color?',
          'Blue, no Green!',
      );

      expect(qa.question, equals('What is your favorite color?'));
      expect(qa.answer, equals('Blue, no Green!'));
    });

    test('instantiates from named constructor', () {
      final qa = QuestionAnswer.named(
        answer: 'Blue, no Green!',
        question: 'What is your favorite color?',
      );

      expect(qa.question, equals('What is your favorite color?'));
      expect(qa.answer, equals('Blue, no Green!'));
    });


    test('instantiates from withQuestion constructor', () {
      final qa = QuestionAnswer.withQuestion('What is your favorite color?');

      expect(qa.question, equals('What is your favorite color?'));
      expect(qa.answer, isNull);
    });

  }