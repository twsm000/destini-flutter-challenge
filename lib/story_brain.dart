import 'story.dart';
import 'story_mapper.dart';

enum StoryChoice { first, second }

class StoryBrain {
  StoryMapper _stories = StoryMapper();
  Story _currentStory;

  StoryBrain() {
    restart();
  }

  void restart() {
    _currentStory = _stories.beginning;
  }

  String getStory() {
    return _currentStory.storyTitle;
  }

  String getFirstChoice() {
    return _currentStory.choice1;
  }

  String getSecondChoice() {
    return _currentStory.choice2;
  }

  void nextStory(StoryChoice choice) {
    StorySplitPath path = _stories.path(_currentStory);

    if (path == null) {
      _currentStory = null;
      restart();
      return;
    }

    switch (choice) {
      case StoryChoice.first:
        {
          _currentStory = path.firstChoice;
          break;
        }

      case StoryChoice.second:
        {
          _currentStory = path.secondChoice;
          break;
        }
    }
  }

  bool buttonShouldBeVisible() {
    return getSecondChoice() != '';
  }
}
