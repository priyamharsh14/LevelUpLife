import 'package:LevelUpLife/DB_helper.dart';
import 'package:LevelUpLife/components/corners.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:animated_text_kit/animated_text_kit.dart';

class IntroPage extends StatefulWidget {
  @override
  _IntroPageState createState() => _IntroPageState();
}

class _IntroPageState extends State<IntroPage> {
  bool isProceed = false;
  bool _displayIntro = false;

  final dbHelper = DBHelper.instance;

  @override
  void initState() {
    super.initState();
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);
    dbHelper.getRowCount('userinfo').then((value) {
      if (value > 0) {
        Navigator.pushNamedAndRemoveUntil(
            context, 'DashboardPage', (route) => false);
      } else {
        setState(() {
          _displayIntro = true;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.black,
      child: Visibility(
        visible: _displayIntro,
        child: Stack(
          children: [
            GestureDetector(
              onTap: () {
                setState(() {
                  isProceed = true;
                });
              },
              child: Container(
                height: context.screenHeight,
                width: context.screenWidth,
                child: VStack(
                  [
                    Visibility(
                      visible: !_displayIntro,
                      child: CircularProgressIndicator(
                        backgroundColor: Colors.blueAccent,
                      ).centered(),
                    ),
                    Container(
                      height: context.percentHeight * 45,
                      width: context.percentWidth * 90,
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.blue),
                          gradient: RadialGradient(
                            colors: [
                              Colors.blue[700],
                              Colors.blue[700].withOpacity(0.75),
                              Colors.blue[700].withOpacity(0.25),
                            ],
                            radius: 1,
                          )),
                      child: Stack(
                          alignment: Alignment.topCenter,
                          children: getImageCorners(context.percentHeight * 7) +
                              [
                                VStack(
                                  [
                                    SizedBox(
                                      height: context.percentHeight * 5,
                                    ),
                                    Container(
                                      color: Colors.blue,
                                      height: 1,
                                      width: context.percentWidth * 65,
                                    ),
                                    HStack([
                                      Icon(
                                        Icons.error_outline,
                                        color: Colors.white,
                                        size: 35,
                                      ),
                                      SizedBox(width: context.percentWidth * 1),
                                      'ALERT'
                                          .text
                                          .xl4
                                          .fontFamily("Oswald")
                                          .textStyle(TextStyle(shadows: [
                                            Shadow(
                                              blurRadius: 7.5,
                                              color: Colors.black,
                                            )
                                          ]))
                                          .center
                                          .color(Colors.white)
                                          .makeCentered(),
                                    ]),
                                    SizedBox(
                                      height: context.percentHeight * 0.5,
                                    ),
                                    Container(
                                      color: Colors.blue,
                                      height: 1,
                                      width: context.percentWidth * 65,
                                    ),
                                    SizedBox(height: context.percentHeight * 5),
                                    Visibility(
                                      visible: !isProceed,
                                      child: RichText(
                                          textAlign: TextAlign.center,
                                          textScaleFactor: 1.25,
                                          text: TextSpan(
                                              text:
                                                  "[YOU HAVE COMPLETED ALL THE NECESSARY REQUIREMENTS OF THE SECRET QUEST ",
                                              style: TextStyle(
                                                color: Colors.white,
                                                fontFamily: "Oswald",
                                                shadows: [
                                                  Shadow(
                                                    blurRadius: 7.5,
                                                    color: Colors.black,
                                                  ),
                                                ],
                                              ),
                                              children: <TextSpan>[
                                                TextSpan(
                                                  text:
                                                      "'A STEP TOWARDS CHANGE'",
                                                  style: TextStyle(
                                                    color: Colors.purpleAccent,
                                                    fontFamily: "Oswald",
                                                    shadows: [
                                                      Shadow(
                                                        blurRadius: 7.5,
                                                        color: Colors.black,
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                TextSpan(
                                                  text: "]",
                                                  style: TextStyle(
                                                    color: Colors.white,
                                                    fontFamily: "Oswald",
                                                    shadows: [
                                                      Shadow(
                                                        blurRadius: 7.5,
                                                        color: Colors.black,
                                                      ),
                                                    ],
                                                  ),
                                                )
                                              ])),
                                    ),
                                    Visibility(
                                        visible: isProceed,
                                        child: VStack([
                                          "YOU HAVE EARNED THE RIGHT\nTO BECOME A PLAYER."
                                              .text
                                              .xl
                                              .fontFamily("Oswald")
                                              .textStyle(TextStyle(shadows: [
                                                Shadow(
                                                  blurRadius: 7.5,
                                                  color: Colors.black,
                                                )
                                              ]))
                                              .center
                                              .color(Colors.white)
                                              .makeCentered(),
                                          SizedBox(
                                            height: context.percentHeight * 2,
                                          ),
                                          "WILL YOU ACCEPT?"
                                              .text
                                              .xl
                                              .fontFamily("Oswald")
                                              .textStyle(TextStyle(shadows: [
                                                Shadow(
                                                  blurRadius: 7.5,
                                                  color: Colors.black,
                                                )
                                              ]))
                                              .center
                                              .color(Colors.white)
                                              .makeCentered(),
                                        ])),
                                    SizedBox(height: context.percentHeight * 3),
                                    Visibility(
                                        visible: isProceed,
                                        child: HStack([
                                          FlatButton(
                                            onPressed: () {
                                              Navigator.pushNamed(
                                                  context, 'RegisterPage');
                                            },
                                            shape: ContinuousRectangleBorder(
                                                side: BorderSide(
                                                    color: Colors.white)),
                                            color: Colors.blue[600],
                                            child: "ACCEPT"
                                                .text
                                                .xl
                                                .fontFamily("Oswald")
                                                .textStyle(TextStyle(shadows: [
                                                  Shadow(
                                                    blurRadius: 4,
                                                    color: Colors.white,
                                                  )
                                                ]))
                                                .center
                                                .color(Colors.white)
                                                .makeCentered(),
                                          ),
                                          SizedBox(
                                            width: context.percentWidth * 5,
                                          ),
                                          FlatButton(
                                            onPressed: () {
                                              SystemNavigator.pop();
                                            },
                                            shape: ContinuousRectangleBorder(
                                                side: BorderSide(
                                                    color: Colors.white)),
                                            color: Colors.blue[600],
                                            child: "REFUSE"
                                                .text
                                                .xl
                                                .fontFamily("Oswald")
                                                .textStyle(TextStyle(shadows: [
                                                  Shadow(
                                                    blurRadius: 4,
                                                    color: Colors.white,
                                                  )
                                                ]))
                                                .center
                                                .color(Colors.white)
                                                .makeCentered(),
                                          )
                                        ]))
                                  ],
                                  alignment: MainAxisAlignment.center,
                                  crossAlignment: CrossAxisAlignment.center,
                                ),
                                Positioned(
                                  bottom: 2,
                                  child: Visibility(
                                    visible: !isProceed,
                                    child: FadeAnimatedTextKit(
                                        totalRepeatCount: 10,
                                        text: [
                                          "TAP TO PROCEED",
                                        ],
                                        textStyle:
                                            TextStyle(color: Colors.white70),
                                        textAlign: TextAlign.start,
                                        alignment:
                                            AlignmentDirectional.topStart),
                                  ).centered(),
                                ),
                              ]),
                    ),
                  ],
                  alignment: MainAxisAlignment.center,
                  crossAlignment: CrossAxisAlignment.center,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
