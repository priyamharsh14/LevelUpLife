import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:velocity_x/velocity_x.dart';

class WelcomePage extends StatefulWidget {
  @override
  _WelcomePageState createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  @override
  void initState() {
    super.initState();
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);
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
                Container(
                  height: context.percentHeight * 25,
                  width: context.percentWidth * 80,
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
                  child: Stack(
                    children: [
                      Positioned(
                        child: Icon(
                          Icons.close,
                          color: Colors.blue[200],
                          size: context.percentHeight * 2.5,
                        ),
                        right: context.percentWidth * 4,
                        top: context.percentHeight * 2,
                      ),
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
                      "[WELCOME, PRIYAM]"
                          .text
                          .xl2
                          .fontFamily("Oswald")
                          .textStyle(TextStyle(shadows: [
                            Shadow(
                              blurRadius: 7.5,
                              color: Colors.black,
                            )
                          ]))
                          .color(Colors.white)
                          .makeCentered(),
                    ],
                  ),
                )
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
