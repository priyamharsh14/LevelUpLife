import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/animation.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:delayed_display/delayed_display.dart';
import 'package:LevelUpLife/screens/registration_screen.dart';
// import 'package:shared_preferences/shared_preferences.dart';

class WelcomePage extends StatefulWidget {
  @override
  _WelcomePageState createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage>
    with TickerProviderStateMixin {
  AnimationController controller;
  Animation<double> animation;

  @override
  void initState() {
    super.initState();
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);

    controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 500),
    );

    animation =
        CurvedAnimation(parent: controller, curve: Curves.easeInOutCubic);
    controller.forward();
    controller.addListener(() {
      setState(() {});
    });
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Stack(
        children: [
          Container(
            width: context.screenWidth,
            height: context.screenHeight,
            color: Colors.black,
            child: VStack(
              [
                ScaleTransition(
                  scale: animation,
                  child: Container(
                    height: context.percentHeight * 22.5,
                    width: context.percentWidth * 80,
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.blue),
                        gradient: RadialGradient(
                          colors: [
                            Colors.blue[700],
                            Colors.blue[700].withOpacity(0.75),
                            Colors.blue[700].withOpacity(0.25),
                          ],
                          radius: 1.25,
                        )),
                    child: Stack(
                      children: [
                        // Positioned(
                        //   child: Icon(
                        //     Icons.close,
                        //     color: Colors.blue[200],
                        //     size: context.percentHeight * 2.5,
                        //   ),
                        //   right: context.percentWidth * 4,
                        //   top: context.percentHeight * 2,
                        // ),
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
                              horizontal: context.percentWidth * 10),
                          child: "[WELCOME, PLAYER]"
                              .text
                              .xl2
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
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: context.screenHeight / 15,
                ),
                FlatButton(
                  onPressed: () {
                    Navigator.pushNamed(context, RegistrationScreen.id);
                  },
                  child: DelayedDisplay(
                    delay: Duration(seconds: 2, milliseconds: 800),
                    slidingCurve: Curves.linearToEaseOut,
                    slidingBeginOffset: Offset(0, 0),
                    child: Container(
                      height: context.percentHeight * 8,
                      width: context.percentWidth * 40,
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.blue),
                        gradient: RadialGradient(
                          colors: [
                            Colors.blue[700],
                            Colors.blue[700].withOpacity(0.75),
                            Colors.blue[700].withOpacity(0.50),
                          ],
                          radius: 1.5,
                        ),
                      ),
                      child: Stack(children: [
                        Positioned(
                          top: 0,
                          left: 0,
                          child: RotatedBox(
                            quarterTurns: 0,
                            child: Image.asset(
                              'assets/images/corner.png',
                              height: context.percentHeight * 4.2,
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
                              height: context.percentHeight * 4.2,
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
                              height: context.percentHeight * 4.2,
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
                              height: context.percentHeight * 4.2,
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: context.percentWidth * 10),
                          child: "PROCEED"
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
                              .color(Colors.yellow[600])
                              .makeCentered(),
                        ),
                      ]),
                    ),
                  ),
                ),
              ],
              alignment: MainAxisAlignment.center,
              crossAlignment: CrossAxisAlignment.center,
            ),
          )
        ],
      ),
    );
  }
}
