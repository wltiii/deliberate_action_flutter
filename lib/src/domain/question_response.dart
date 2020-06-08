class QuestionResponse {
  String expectationQuestion;
  String expectionResponse;

  // TODO discuss these constructor styles with Richard

  // a parameterized constructor
  // see: https://flutterrdart.com/dart-classes-objects-and-constructors-with-examples/
  QuestionResponse(
    this.expectationQuestion,
    this.expectionResponse,
  );

  // default constructor using named arguments
  // see: https://flutterigniter.com/deconstructing-dart-constructors/
  // TODO  do we want this a named constructor, or make it the default
  // TODO constructor? I think I prefer the latter.
  // TODO Is there a style check that would enforce default using named args?
  QuestionResponse.named({
    this.expectationQuestion,
    this.expectionResponse,
  });

  // a redirecting constructor
  // see: https://dart.dev/guides/language/language-tour#using-constructors
  QuestionResponse.question(String question) : this(question, null);
}