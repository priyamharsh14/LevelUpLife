import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:horizontal_picker/horizontal_picker.dart';
import 'package:LevelUpLife/components/box_card.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

enum gender {
  male,
  female,
}

class RegistrationScreen extends StatefulWidget {
  static final String id = 'RegistrationScreen';

  @override
  _RegistrationScreenState createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  gender selected;
  String name;
  double age;
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
      child: Container(
        width: context.screenWidth,
        height: context.screenHeight,
        color: Colors.black,
        child: VStack(
          [
            Container(
              height: context.percentHeight * 77,
              width: context.percentWidth * 90,
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
                      height: context.percentHeight * 10,
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
                      height: context.percentHeight * 10,
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
                      height: context.percentHeight * 10,
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
                      height: context.percentHeight * 10,
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: context.percentWidth * 6,
                      vertical: context.percentWidth * 1.5),
                  child: Column(
                    //mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      "ENTER YOUR DETAILS"
                          .text
                          .xl3
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
                        height: context.percentWidth * 3,
                        width: context.percentWidth * 70,
                        child: Divider(
                          color: Colors.white54,
                        ),
                      ),
                     // SizedBox(height: context.percentWidth * 4),
                      'NAME: '
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
                      SizedBox(height: context.percentWidth * 2),
                      TextField(
                        onChanged: (value) {
                          setState(() {
                            name = value;
                          });
                        },
                        textAlign: TextAlign.center,
                        decoration: InputDecoration(
                          filled: true,
                          hintText: 'Enter your name',
                          fillColor: Colors.white,
                          contentPadding: EdgeInsets.symmetric(
                              vertical: 10.0, horizontal: 20.0),
                          border: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(32.0)),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: Colors.blueAccent, width: 1.0),
                            borderRadius:
                                BorderRadius.all(Radius.circular(32.0)),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: Colors.blueAccent, width: 2.0),
                            borderRadius:
                                BorderRadius.all(Radius.circular(32.0)),
                          ),
                        ),
                      ),
                      SizedBox(height: context.percentWidth * 3),
                      'GENDER: '
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
                      Expanded(
                        child: Row(
                          children: <Widget>[
                            Expanded(
                              child: GestureDetector(
                                onTap: () {
                                  setState(() {
                                    selected = gender.male;
                                  });
                                },
                                child: BoxCard(
                                  icon: FontAwesomeIcons.mars,
                                  label: 'MALE',
                                  color: selected == gender.male
                                      ? Colors.lightBlue[400]
                                      : Colors.blue[600],
                                ),
                              ),
                            ),
                            Expanded(
                              child: GestureDetector(
                                onTap: () {
                                  setState(() {
                                    selected = gender.female;
                                  });
                                },
                                child: BoxCard(
                                  icon: FontAwesomeIcons.venus,
                                  label: 'FEMALE',
                                  color: selected == gender.female
                                      ? Colors.lightBlue[400]
                                      : Colors.blue[600],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: context.percentWidth * 2),
                      'AGE: '
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
                      Flexible(
                          child: HorizantalPicker(
                        minValue: 5,
                        maxValue: 90,
                        divisions: 85,
                        suffix: " year",
                        showCursor: false,
                        backgroundColor: Colors.white,
                        activeItemTextColor: Colors.black,
                        passiveItemsTextColor: Colors.blue,
                        onChanged: (value) {
                          setState(() {
                            age = value;
                          });
                        },
                      )),
                    ],
                  ),
                ),
              ]),
            ),
            SizedBox(height: context.percentWidth * 8),
            FlatButton(
              onPressed: () {
                // ignore: todo
                //TODO: Add onPressed Functionality
              },
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
          ],
          alignment: MainAxisAlignment.end,
          crossAlignment: CrossAxisAlignment.center,
        ),
      ),
    );
  }
}
