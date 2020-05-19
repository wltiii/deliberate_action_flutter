class Reflection {
  final Duration actualDuration;
  final String activityTitle;
  final String activityHint;
  // TODO have the expectations as well? The entire object? Or entries with each expectation and associated response?
  final List reflectionResponses;

  Reflection({
    this.activityTitle,
    this.activityHint,
    this.actualDuration,
    this.reflectionResponses
  });
}

final reflection = new Reflection(
  actualDuration: Duration(minutes: 0),
  activityTitle: 'What do you plan to accomplish during this session?',
  activityHint: 'Enter your intention.',
  reflectionResponses: [
      'What happened during the allotted time?',
      'What explains the difference?',
      'What action can you take to improve outcomes?'
    ]
);