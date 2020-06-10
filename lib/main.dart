import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(LeApp());
}

class LeApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.lightBlue),
      home: AboutMe(title: 'AboutMe'),
    );
  }
}

class AboutMe extends StatefulWidget {
  AboutMe({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _AboutMeState createState() => _AboutMeState();
}

class _AboutMeState extends State<AboutMe> with SingleTickerProviderStateMixin {
  AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller =
        AnimationController(duration: const Duration(seconds: 10), vsync: this)
          ..repeat();
  }

  Animatable<Color> background = TweenSequence<Color>([
    TweenSequenceItem(
      weight: 1.0,
      tween: ColorTween(
        begin: Colors.lightBlue,
        end: Colors.purple,
      ),
    ),
    TweenSequenceItem(
      weight: 1.0,
      tween: ColorTween(
        begin: Colors.purple,
        end: Colors.pink,
      ),
    ),
    TweenSequenceItem(
      weight: 1.0,
      tween: ColorTween(
        begin: Colors.pink,
        end: Colors.lightBlue,
      ),
    ),
  ]);

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
        animation: _controller,
        builder: (context, child) {
          return Scaffold(
            backgroundColor:
                background.evaluate(AlwaysStoppedAnimation(_controller.value)),
            body: SafeArea(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      CircleAvatar(
                        backgroundImage: AssetImage('images/le_portrait.jpg'),
                        radius: 50,
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        "Habib Mohamed",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontFamily: 'Arvo',
                          fontSize: 24,
                          color: Colors.white,
                          letterSpacing: 2.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  Divider(
                    color: Colors.white,
                  ),
                  Card(
                    child: ListTile(
                      title: Text(
                        '226-260-7636',
                        style: TextStyle(
                          fontFamily: 'ArchitectsDaughter',
                          fontSize: 18,
                          color: background.evaluate(
                            AlwaysStoppedAnimation(_controller.value),
                          ),
                        ),
                      ),
                      leading: Icon(
                        Icons.phone,
                        color: background.evaluate(
                            AlwaysStoppedAnimation(_controller.value)),
                      ),
                    ),
                  ),
                  Card(
                    child: ListTile(
                      title: Text(
                        'abdirahiimm@gmail.com',
                        style: TextStyle(
                          fontFamily: 'ArchitectsDaughter',
                          fontSize: 18,
                          color: background.evaluate(
                              AlwaysStoppedAnimation(_controller.value)),
                        ),
                      ),
                      leading: Icon(
                        Icons.mail,
                        color: background.evaluate(
                          AlwaysStoppedAnimation(_controller.value),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        });
  }
}
