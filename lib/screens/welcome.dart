import 'package:LevelUpLife/DB_helper.dart';
import 'package:LevelUpLife/components/corners.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/animation.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:delayed_display/delayed_display.dart';

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
    bool _isNewUser = false;
    final dbHelper = DBHelper.instance;

    Future<String> _getDisplayName() async {
      Map<String, dynamic> row = await dbHelper.getUserInfo();
      if (row == null) {
        _isNewUser = true;
        return "PLAYER";
      }
      return row['fullname'].toString().split(" ")[0].toUpperCase();
    }

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
                          radius: 1.2,
                        )),
                    child: Stack(
                      children: getImageCorners(context.percentHeight * 8) +
                          [
                            Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: context.percentWidth * 10),
                              child: FutureBuilder(
                                future: _getDisplayName(),
                                builder: (context, snapshot) {
                                  switch (snapshot.connectionState) {
                                    case ConnectionState.waiting:
                                      return const CircularProgressIndicator(
                                        backgroundColor: Colors.blueAccent,
                                      ).centered();
                                    default:
                                      if (snapshot.hasError) {
                                        return "[ERROR]\n${snapshot.error.toString()}"
                                            .text
                                            .lg
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
                                        return "[WELCOME, ${snapshot.data}]"
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
                  ),
                ),
                SizedBox(
                  height: context.percentHeight * 5,
                ),
                FlatButton(
                  onPressed: () {
                    if (_isNewUser) {
                      Navigator.pushNamed(context, 'RegisterPage');
                    } else {
                      Navigator.pushNamedAndRemoveUntil(
                          context, 'DashboardPage', (route) => false);
                    }
                  },
                  child: DelayedDisplay(
                    delay: Duration(seconds: 2),
                    slidingCurve: Curves.linearToEaseOut,
                    slidingBeginOffset: Offset(0, 0),
                    child: Container(
                      height: context.percentHeight * 7,
                      width: context.percentWidth * 40,
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.blue),
                        gradient: RadialGradient(
                          colors: [
                            Colors.blue[700],
                            Colors.blue[700].withOpacity(0.75),
                            Colors.blue[700].withOpacity(0.50),
                          ],
                          radius: 1.2,
                        ),
                      ),
                      child: Stack(
                        children: getLineCorners(context.percentHeight * 0.5,
                                context.percentWidth * 4) +
                            [
                              Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal: context.percentWidth * 10),
                                child: "[PROCEED]"
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
                              )
                            ],
                      ),
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
