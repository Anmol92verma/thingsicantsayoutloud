import 'dart:async';

import 'package:flutter/material.dart';

import 'ProjectColors.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application. 186 194 147
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Can't Say out loud",
      theme: ThemeData(
        primarySwatch: loudAppColor,
      ),
      home: SplashPage(),
    );
  }
}

class SplashPage extends StatefulWidget {
  SplashPage({Key key}) : super(key: key);

  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  PageController _pageController = new PageController();

  Timer scrollTimer;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) => startTheTimer());
  }

  startTheTimer() {
    scrollTimer =
        Timer.periodic(Duration(seconds: 3), (Timer t) => nextPager());
  }

  @override
  Widget build(BuildContext context) {
    return new Material(
      child: splitViews(),
    );
  }

  Widget speechBubble(String quote) {
    return Container(
      margin: EdgeInsets.all(60),
      child: Material(
        borderRadius: BorderRadius.all(
          Radius.circular(20),
        ),
        color: darkAppColor,
        elevation: 1.0,
        child: Container(
          alignment: Alignment.center,
          child: Text(quote,
              style: TextStyle(color: loudAppColor.shade50, fontSize: 20),
              textAlign: TextAlign.center),
          padding: EdgeInsets.all(10.0),
        ),
      ),
    );
  }

  splitViews() {
    return Column(children: <Widget>[
      Expanded(
        child: Container(
          child: new Text("\"THINGS I CAN'T\n        SAY OUT LOUD\" ",
              style: TextStyle(
                color: darkAppColor,
                fontSize: 35,
                fontStyle: FontStyle.italic,
                fontWeight: FontWeight.w500,
              ),
              textAlign: TextAlign.center),
          alignment: Alignment.center,
          color: loudAppColor.shade600,
          padding: EdgeInsets.all(15.0),
        ),
      ),
      Expanded(
        child: Container(
            child: PageView(physics: NeverScrollableScrollPhysics(),
                controller: _pageController, children: getSpeechBubbles()),
            color: loudAppColor.shade900),
      )
    ]);
  }

  getSpeechBubbles() {
    var quotes = [
      "\"Every secret of a writer’s soul, every experience of his life, every quality of his mind, is written large in his works.\"\n— Virginia Woolf ",
      "\"Read a thousand books, and your words will flow like a river.\"\n― Lisa See ",
      "\"You can always edit a bad page. You can’t edit a blank page.\"\n―Jodi Picoult",
      "\"Start writing, no matter what. The water does not flow until the faucet is turned on.\"\n— Louis L’Amour",
      "\"Don’t tell me the moon is shining; show me the glint of light on broken glass.\"\n― Anton Chekhov",
      "\"There is no greater agony than bearing an untold story inside you.\"\n― Maya Angelou"
    ];
    var bubbles = List<Widget>();
    for (var o in quotes) {
      bubbles.add(speechBubble(o));
    }
    return bubbles;
  }

  nextPager() {
    print(_pageController.page.round());
    if (_pageController.page.round() == 5) {
      _pageController.animateToPage(0,
          duration: Duration(milliseconds: 1), curve: Curves.linear);
    } else {
      _pageController.nextPage(
          duration: Duration(milliseconds: 500), curve: Curves.ease);
    }
  }
}
