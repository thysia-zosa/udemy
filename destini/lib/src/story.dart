class Story {
  /// stores the story text.
  final String storyTitle;

  /// stores the text for choice 1.
  final String choice1;

  /// stores the text for choice 2.
  final String choice2;

  Map<int, int>? next;

  Story({
    required this.storyTitle,
    required this.choice1,
    required this.choice2,
    this.next,
  });
}
