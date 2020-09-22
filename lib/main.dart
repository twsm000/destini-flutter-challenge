import 'package:destini_challenge_starting/story_brain.dart';
import 'package:flutter/material.dart';

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
            setState(() {
              _stories.nextStory(StoryChoice.first);
            });
          },
          color: Colors.red,
          child: Text(
            _stories.getFirstChoice(),
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
        child: Visibility(
          visible: _stories.buttonShouldBeVisible(),
          child: FlatButton(
            onPressed: () {
              setState(() {
                _stories.nextStory(StoryChoice.second);
              });
            },
            color: Colors.blue,
            child: Text(
              _stories.getSecondChoice(),
              style: TextStyle(
                fontSize: 20.0,
              ),
            ),
          ),
        ),
      ),
    ];
  }
}

//TODO: Step 29 - Run the app and test it against the Story Outline to make sure you've completed all the steps. The code for the completed app can be found here: https://github.com/londonappbrewery/destini-challenge-completed/
