import 'package:destini_challenge_starting/story_brain.dart';
import 'package:flutter/material.dart';

//TODO: Step 15 - Run the app and see if you can see the screen update with the first story. Delete this TODO if it looks as you expected.

void main() => runApp(Destini());

class Destini extends StatelessWidget {
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(),
      home: StoryPage(),
    );
  }
}

class StoryPage extends StatefulWidget {
  _StoryPageState createState() => _StoryPageState();
}

class _StoryPageState extends State<StoryPage> {
  StoryBrain _stories = StoryBrain();

  @override
  Widget build(BuildContext context) {
    return _getMainPage();
  }

  Widget _getMainPage() {
    return Scaffold(
      body: Container(
        decoration: _getBackground(),
        padding: EdgeInsets.symmetric(vertical: 50.0, horizontal: 15.0),
        constraints: BoxConstraints.expand(),
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: _getMainPageChildren(),
          ),
        ),
      ),
    );
  }

  Decoration _getBackground() {
    return BoxDecoration(
      image: DecorationImage(
        image: AssetImage("images/background.png"),
        fit: BoxFit.fill,
      ),
    );
  }

  List<Widget> _getMainPageChildren() {
    return [
      Expanded(
        flex: 12,
        child: Center(
          child: Text(
            _stories.getStory(),
            style: TextStyle(
              fontSize: 25.0,
            ),
          ),
        ),
      ),
      Expanded(
        flex: 2,
        child: FlatButton(
          onPressed: () {
            //Choice 1 made by user.
            //TODO: Step 18 - Call the nextStory() method from storyBrain and pass the number 1 as the choice made by the user.
          },
          color: Colors.red,
          child: Text(
            //TODO: Step 13 - Use the storyBrain to get the text for choice 1.
            'Choice 1',
            style: TextStyle(
              fontSize: 20.0,
            ),
          ),
        ),
      ),
      SizedBox(
        height: 20.0,
      ),
      Expanded(
        flex: 2,
        //TODO: Step 26 - Use a Flutter Visibility Widget to wrap this FlatButton.
        //TODO: Step 28 - Set the "visible" property of the Visibility Widget to equal the output from the buttonShouldBeVisible() method in the storyBrain.
        child: FlatButton(
          onPressed: () {
            //Choice 2 made by user.
            //TODO: Step 19 - Call the nextStory() method from storyBrain and pass the number 2 as the choice made by the user.
          },
          color: Colors.blue,
          child: Text(
            //TODO: Step 14 - Use the storyBrain to get the text for choice 2.
            'Choice 2',
            style: TextStyle(
              fontSize: 20.0,
            ),
          ),
        ),
      ),
    ];
  }
}

//TODO: Step 24 - Run the app and try to figure out what code you need to add to this file to make the story change when you press on the choice buttons.

//TODO: Step 29 - Run the app and test it against the Story Outline to make sure you've completed all the steps. The code for the completed app can be found here: https://github.com/londonappbrewery/destini-challenge-completed/
