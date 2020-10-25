import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:shared_preferences/shared_preferences.dart';

class WelcomePage extends StatefulWidget {
  @override
  _WelcomePageState createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  Future<String> _firstName;

  @override
  void initState() {
    super.initState();
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);
    _firstName = _prefs.then((SharedPreferences prefs) {
      return (prefs.getString('firstname') ?? "PLAYER");
    });
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
                  height: context.percentHeight * 20,
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
                      Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: context.percentWidth * 10),
                        child: FutureBuilder(
                          future: _firstName,
                          builder: (context, snapshot) {
                            switch (snapshot.connectionState) {
                              case ConnectionState.waiting:
                                return const CircularProgressIndicator();
                              default:
                                if (snapshot.hasError) {
                                  return "ERROR:\n${snapshot.error}"
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
                                      .makeCentered();
                                } else {
                                  return "[WELCOME, ${snapshot.data.toString()}]"
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
                                      .makeCentered();
                                }
                            }
                          },
                        ),
                      ),
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
