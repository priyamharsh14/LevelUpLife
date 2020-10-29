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
  @override
  Widget build(BuildContext context) {
    return Material(
      child: GestureDetector(
        onTap: () {
          setState(() {
            isProceed = true;
          });
        },
        child: Container(
          width: context.screenWidth,
          height: context.screenHeight,
          color: Colors.black,
          child: VStack(
            [
              SizedBox(
                height: context.percentHeight * 25,
              ),
              Container(
                height: context.percentHeight * 50,
                width: context.percentWidth * 90,
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.blue),
                    gradient: RadialGradient(
                      colors: [
                        Colors.blue[700],
                        Colors.blue[700].withOpacity(0.75),
                        Colors.blue[700].withOpacity(0.25),
                      ],
                      radius: 1.2,
                    )),
                child: Stack(children: [
                  Positioned(
                    top: 0,
                    left: 0,
                    child: RotatedBox(
                      quarterTurns: 0,
                      child: Image.asset(
                        'assets/images/corner.png',
                        height: context.percentHeight * 8,
                      ),
                    ),
                  ),
                  Positioned(
                    top: 0,
                    right: 0,
                    child: RotatedBox(
                      quarterTurns: 1,
                      child: Image.asset(
                        'assets/images/corner.png',
                        height: context.percentHeight * 8,
                      ),
                    ),
                  ),
                  Positioned(
                    left: 0,
                    bottom: 0,
                    child: RotatedBox(
                      quarterTurns: 3,
                      child: Image.asset(
                        'assets/images/corner.png',
                        height: context.percentHeight * 8,
                      ),
                    ),
                  ),
                  Positioned(
                    right: 0,
                    bottom: 0,
                    child: RotatedBox(
                      quarterTurns: 2,
                      child: Image.asset(
                        'assets/images/corner.png',
                        height: context.percentHeight * 8,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: context.percentWidth * 4,
                        vertical: context.percentHeight * 1.5),
                    child: VStack(
                      [
                        SizedBox(height: context.percentHeight * 4),
                        SizedBox(
                          height: context.percentHeight * 1,
                          width: context.percentWidth * 70,
                          child: Divider(color: Colors.white38),
                        ),
                        HStack([
                          Icon(
                            Icons.error_outline,
                            color: Colors.white,
                            size: 35,
                          ),
                          SizedBox(width: 3),
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
                          height: context.percentHeight * 1,
                          width: context.percentWidth * 70,
                          child: Divider(color: Colors.white38),
                        ),
                        SizedBox(height: context.percentHeight * 6),
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
                                      text: "'A STEP TOWARDS CHANGE'",
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
                              "YOU HAVE EARNED THE RIGHT TO BECOME A PLAYER."
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
                                height: context.percentHeight * 1.3,
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
                              Navigator.pushNamed(context, 'RegisterPage');
                            },
                            shape: ContinuousRectangleBorder(
                                side: BorderSide(color: Colors.white)),
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
                                side: BorderSide(color: Colors.white)),
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
                  ),
                ]),
              ),
              SizedBox(height: context.percentHeight * 20),
              Visibility(
                visible: !isProceed,
                child: FadeAnimatedTextKit(
                    totalRepeatCount: 10,
                    text: [
                      "Press anywhere to proceed",
                    ],
                    textStyle: TextStyle(color: Colors.white70),
                    textAlign: TextAlign.start,
                    alignment: AlignmentDirectional.topStart),
              )
            ],
            alignment: MainAxisAlignment.center,
            crossAlignment: CrossAxisAlignment.center,
          ),
        ),
      ),
    );
  }
}
