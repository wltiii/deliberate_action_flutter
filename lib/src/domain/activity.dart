class Activity {
  Duration allottedDuration;
  final Duration actualDuration;
  final String activityTitle;
  final String activityHint;
  final List reflectionQuestions;

  Activity({
    this.activityTitle,
    this.activityHint,
    this.allottedDuration,
    this.actualDuration,
    this.reflectionQuestions
  });
}

final activity = new Activity(
  allottedDuration: Duration(minutes: 10),
  actualDuration: Duration(minutes: 0),
  activityTitle: 'What do you plan to accomplish during this session?',
  activityHint: 'Enter your intention.',
  reflectionQuestions: [
      'What happened during the allotted time?',
      'What explains the difference?',
      'What action can you take to improve outcomes?'
    ]
);