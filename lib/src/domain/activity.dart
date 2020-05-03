class Activity {
  int allottedDuration;
  final int actualDuration;
  final String activityTitle;
  final String activityHint;
  final List postActivityHints;

  Activity({
    this.activityTitle,
    this.activityHint,
    this.allottedDuration,
    this.actualDuration,
    this.postActivityHints
  });
}

final activity = new Activity(
  allottedDuration: 10,
  actualDuration: 0,
  activityTitle: 'What do you plan to accomplish during this session?',
  activityHint: 'Enter your intention.',
    postActivityHints: [
      'What happened during the allotted time?',
      'What explains the difference?',
      'What action can you take to improve outcomes?'
    ]
);