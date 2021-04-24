class QuestionAnswer {
  String? question;
  String? answer;

  // TODO use default parameterized constructor (Map constructor)?
  // see: https://flutterrdart.com/dart-classes-objects-and-constructors-with-examples/
  QuestionAnswer(
    this.question,
    this.answer,
  );

  // default constructor using named arguments
  // see: https://flutterigniter.com/deconstructing-dart-constructors/
  // TODO  do we want this a named constructor, or make it the default
  // TODO constructor? I think I prefer the latter.
  // TODO Is there a style check that would enforce default using named args?
  QuestionAnswer.named({
    this.question,
    this.answer,
  });

  // a redirecting constructor
  // see: https://dart.dev/guides/language/language-tour#using-constructors
  QuestionAnswer.withQuestion(String? question) : this(question, null);
}