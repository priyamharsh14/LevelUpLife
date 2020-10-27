import 'package:LevelUpLife/DB_helper.dart';
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

class RegistrationPage extends StatefulWidget {
  @override
  _RegistrationPageState createState() => _RegistrationPageState();
}

class _RegistrationPageState extends State<RegistrationPage> {
  gender selected;
  String name;
  double age;

  final dbHelper = DBHelper.instance;

  Future<void> _register() async {
    int flag = -1;
    if (name.trim() != "" && age.toInt() > 10 && age.toInt() < 91) {
      if (selected == gender.male) {
        flag = await dbHelper.insertRow('userinfo', {
          'id': 1,
          'fullname': name.trim(),
          'age': age.toInt(),
          'gender': 'M'
        });
      } else if (selected == gender.female) {
        flag = await dbHelper.insertRow('userinfo', {
          'id': 1,
          'fullname': name.trim(),
          'age': age.toInt(),
          'gender': 'F'
        });
      }
    }
    if (flag != -1) {
      Navigator.pushNamedAndRemoveUntil(
          context, 'WelcomePage', (route) => false);
    }
  }

  @override
  void initState() {
    super.initState();
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);
    dbHelper.getRowCount('userinfo').then((value) {
      if (value > 0) {
        Navigator.pushNamedAndRemoveUntil(
            context, 'WelcomePage', (route) => false);
      }
    });
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
              height: context.percentHeight * 70,
              width: context.percentWidth * 80,
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
                      horizontal: context.percentWidth * 6,
                      vertical: context.percentHeight * 1.5),
                  child: VStack(
                    [
                      SizedBox(
                        height: context.percentHeight * 1.5,
                      ),
                      "[ENTER YOUR DETAILS]"
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
                        height: context.percentHeight * 1,
                      ),
                      Container(
                        color: Colors.blue[300],
                        height: 1,
                        width: context.percentWidth * 60,
                      ),
                      SizedBox(
                        height: context.percentHeight * 1,
                      ),
                      'NAME:'
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
                      SizedBox(height: context.percentHeight * 1),
                      TextField(
                        onChanged: (value) {
                          name = value;
                        },
                        autofocus: false,
                        keyboardType: TextInputType.name,
                        style: TextStyle(fontFamily: 'Oswald', fontSize: 18),
                        textAlign: TextAlign.center,
                        decoration: InputDecoration(
                          filled: true,
                          hintText: 'Enter your name',
                          fillColor: Colors.blue[200].withOpacity(0.85),
                          contentPadding: EdgeInsets.symmetric(
                              vertical: 10.0, horizontal: 20.0),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(5)),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.blue[300], width: 1),
                            borderRadius: BorderRadius.all(Radius.circular(5)),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.blue[100], width: 2),
                            borderRadius: BorderRadius.all(Radius.circular(5)),
                          ),
                        ),
                      ),
                      SizedBox(height: context.percentHeight * 1),
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
                      HStack([
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              selected = gender.male;
                            });
                          },
                          child: BoxCard(
                            height: context.percentHeight * 15,
                            width: context.percentWidth * 25,
                            icon: FontAwesomeIcons.mars,
                            label: 'MALE',
                            color: selected == gender.male
                                ? Colors.lightBlue[400]
                                : Colors.blue[600],
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              selected = gender.female;
                            });
                          },
                          child: BoxCard(
                            height: context.percentHeight * 15,
                            width: context.percentWidth * 25,
                            icon: FontAwesomeIcons.venus,
                            label: 'FEMALE',
                            color: selected == gender.female
                                ? Colors.lightBlue[400]
                                : Colors.blue[600],
                          ),
                        )
                      ]),
                      SizedBox(height: context.percentHeight * 1),
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
                        minValue: 10,
                        initialPosition: InitialPosition.center,
                        maxValue: 90,
                        divisions: 80,
                        suffix: " year",
                        showCursor: false,
                        backgroundColor: Colors.blue[200].withOpacity(0.75),
                        activeItemTextColor: Colors.black,
                        passiveItemsTextColor: Colors.blue,
                        onChanged: (value) {
                          age = value;
                        },
                      )),
                      Container(
                        color: Colors.blue[300],
                        height: 1,
                        width: context.percentWidth * 60,
                      ),
                    ],
                    alignment: MainAxisAlignment.center,
                    crossAlignment: CrossAxisAlignment.center,
                  ),
                ),
              ]),
            ),
            SizedBox(height: context.percentHeight * 3),
            FlatButton(
              onPressed: () => _register(),
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
                  children: [
                    Positioned(
                      left: context.percentHeight * 0.5,
                      top: context.percentHeight * 0.5,
                      child: RotatedBox(
                        quarterTurns: 0,
                        child: Container(
                          color: Colors.blue[300],
                          width: context.percentWidth * 4,
                          height: 1,
                        ),
                      ),
                    ),
                    Positioned(
                      left: context.percentHeight * 0.5,
                      top: context.percentHeight * 0.5,
                      child: RotatedBox(
                        quarterTurns: 1,
                        child: Container(
                          color: Colors.blue[300],
                          width: context.percentWidth * 4,
                          height: 1,
                        ),
                      ),
                    ),
                    Positioned(
                      right: context.percentHeight * 0.5,
                      bottom: context.percentHeight * 0.5,
                      child: RotatedBox(
                        quarterTurns: 0,
                        child: Container(
                          color: Colors.blue[300],
                          width: context.percentWidth * 4,
                          height: 1,
                        ),
                      ),
                    ),
                    Positioned(
                      right: context.percentHeight * 0.5,
                      bottom: context.percentHeight * 0.5,
                      child: RotatedBox(
                        quarterTurns: 1,
                        child: Container(
                          color: Colors.blue[300],
                          width: context.percentWidth * 4,
                          height: 1,
                        ),
                      ),
                    ),
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
          ],
          alignment: MainAxisAlignment.center,
          crossAlignment: CrossAxisAlignment.center,
        ),
      ),
    );
  }
}
