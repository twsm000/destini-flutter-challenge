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
}

//TODO: Step 25 - Change the storyNumber property into a private property so that only story_brain.dart has access to it. You can do this by right clicking on the name (storyNumber) and selecting Refactor -> Rename to make the change across all the places where it's used.

//TODO: Step 27 - Create a method called buttonShouldBeVisible() which checks to see if storyNumber is 0 or 1 or 2 (when both buttons should show choices) and return true if that is the case, else it should return false.
